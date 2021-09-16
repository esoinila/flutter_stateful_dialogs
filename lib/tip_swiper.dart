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
    return Center(
        child: SimpleGestureDetector(
      onHorizontalSwipe: _onHorizontalSwipe,
      swipeConfig: SimpleSwipeConfig(
        verticalThreshold: 40.0,
        horizontalThreshold: 40.0,
        swipeDetectionBehavior: SwipeDetectionBehavior.continuousDistinct,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                tutorialPages[currentPage].topWidget,
              ],
            ),
            _currentPageIndicator(),
            Expanded(child: tutorialPages[currentPage].bottomWidget),
          ],
        ),
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
              print('Dot got tapped');
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
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('Tila-ruutu', style: TextStyle(color: Colors.white)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('lib/images/tutorial_1.png',
                fit: BoxFit.fitHeight, height: 200, width: 200),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('lib/images/Tila.png', fit: BoxFit.fitHeight, height: 60, width: 60),
          ),
        ],
      ),
      bottomWidget: Column(
        children: [
          Text('Tila-ruudussa näet verkon tilan ja GeoTrimmiin liittyviä tweettejä.',
              style: TextStyle(color: Colors.white)),
          Text('Tila ruutuun pääset tila-tabista', style: TextStyle(color: Colors.white)),
        ],
      ),
    ),
    TutorialPage(
      topWidget: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('Info-ruutu', style: TextStyle(color: Colors.white)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('lib/images/tutorial_2.png',
                fit: BoxFit.fitHeight, height: 200, width: 200),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('lib/images/Tiedotteet.png',
                fit: BoxFit.fitHeight, height: 60, width: 60),
          ),
        ],
      ),
      bottomWidget: Column(
        children: [
          Text('Info ruudussa voit tutustua Geotrimmin ratkaisuiden käyttökohteisiin.',
              style: TextStyle(color: Colors.white)),
          Text('Info ruutuun pääset info-tabista', style: TextStyle(color: Colors.white)),
        ],
      ),
    ),
    TutorialPage(
      topWidget: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('Tuki-ruutu', style: TextStyle(color: Colors.white)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('lib/images/tutorial_3.png',
                fit: BoxFit.fitHeight, height: 200, width: 200),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('lib/images/Tuki.png', fit: BoxFit.fitHeight, height: 60, width: 60),
          ),
        ],
      ),
      bottomWidget: Column(
        children: [
          Text(
              'Tuki ruudussa on usein kysytyt kysymykset ja voit ottaa yhteyttä meihin kuvien kera.',
              style: TextStyle(color: Colors.white)),
          Text('Tuki ruutuun pääset tuki-tabista', style: TextStyle(color: Colors.white)),
        ],
      ),
    ),
  ];
}
