import 'package:flutter/material.dart';
import 'package:flutter_stateful_dialogs/tutorial_page.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class TipSwiper extends StatefulWidget {
  const TipSwiper({Key key}) : super(key: key);

  @override
  _TipSwiperState createState() => _TipSwiperState();
}

class _TipSwiperState extends State<TipSwiper> {
  int currentPage = 0;

  void cyclePagesForward() {
    setState(() {
      if (currentPage < tutorialPages.length - 1) {
        currentPage++;
      } else {
        Navigator.of(context).pop();
      }
    });
  }

  void cyclePagesBackward() {
    setState(() {
      if (currentPage > 0) {
        currentPage--;
      }
    });
  }

  void goToSpecificPage(int wantedPage) {
    if (wantedPage < tutorialPages.length) {
      if (wantedPage >= 0) {
        setState(() {
          currentPage = wantedPage;
        });
      }
    }
  }

  void _onHorizontalSwipe(SwipeDirection direction) {
    setState(() {
      if (direction == SwipeDirection.left) {
        cyclePagesForward();
        print('Swiped left!');
      } else {
        cyclePagesBackward();
        print('Swiped right!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SimpleGestureDetector(
      onHorizontalSwipe: _onHorizontalSwipe,
      swipeConfig: SimpleSwipeConfig(
        verticalThreshold: 40.0,
        horizontalThreshold: 40.0,
        swipeDetectionBehavior: SwipeDetectionBehavior.continuousDistinct,
      ),
      child: Column(
        children: [
          Flexible(
            flex: 19,
            child: Expanded(
              child: Column(
                children: [
                  tutorialPages[currentPage].topWidget,
                ],
              ),
            ),
          ),
          Flexible(flex: 2, child: _currentPageIndicator()),
          Flexible(
            flex: 6,
            child: tutorialPages[currentPage].bottomWidget,
          ),
        ],
      ),
    ));
  }

  Widget _currentPageIndicator() {
    List<Widget> myWidgetList = [];
    for (int i = 0; i < tutorialPages.length; i++) {
      if (i == currentPage) {
        myWidgetList.add(
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.circle, color: Colors.white70),
          ),
        );
      } else {
        // buttoneiksi tässä
        myWidgetList.add(
          InkWell(
            onTap: () {
              goToSpecificPage(i);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.circle, color: Colors.white24),
            ),
          ),
        );
      }
    }
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: myWidgetList);
  }

  final List<TutorialPage> tutorialPages = <TutorialPage>[
    TutorialPage(
      topWidget: Column(
        children: [
          Image.asset('lib/images/tutorial_1.png', fit: BoxFit.fitHeight, height: 400, width: 400),
          Image.asset('lib/images/Tila.png', fit: BoxFit.fitHeight, height: 90, width: 90),
        ],
      ),
      bottomWidget: Column(
        children: [
          Text('Tila-ruutu', style: TextStyle(color: Colors.white)),
          Text('Tila-ruudussa näet verkon tilan ja GeoTrimmiin liittyviä tweettejä.',
              style: TextStyle(color: Colors.white)),
          Text('Tila ruutuun pääset tila-tabista', style: TextStyle(color: Colors.white)),
        ],
      ),
    ),
    TutorialPage(
      topWidget: Column(
        children: [
          Image.asset('lib/images/tutorial_2.png', fit: BoxFit.fitHeight, height: 400, width: 400),
          Image.asset('lib/images/Tiedotteet.png', fit: BoxFit.fitHeight, height: 90, width: 90),
        ],
      ),
      bottomWidget: Column(
        children: [
          Text('Info-ruutu', style: TextStyle(color: Colors.white)),
          Text('Info ruudussa voit tutustua Geotrimmin ratkaisuiden käyttökohteisiin.',
              style: TextStyle(color: Colors.white)),
          Text('Info ruutuun pääset info-tabista', style: TextStyle(color: Colors.white)),
        ],
      ),
    ),
    TutorialPage(
      topWidget: Column(
        children: [
          Image.asset('lib/images/tutorial_3.png', fit: BoxFit.fitHeight, height: 400, width: 400),
          Image.asset('lib/images/Tuki.png', fit: BoxFit.fitHeight, height: 90, width: 90),
        ],
      ),
      bottomWidget: Column(
        children: [
          Text('Tuki-ruutu', style: TextStyle(color: Colors.white)),
          Text(
              'Tuki ruudussa on usein kysytyt kysymykset ja voit ottaa yhteyttä meihin kuvien kera.',
              style: TextStyle(color: Colors.white)),
          Text('Tuki ruutuun pääset tuki-tabista', style: TextStyle(color: Colors.white)),
        ],
      ),
    ),
  ];
}
