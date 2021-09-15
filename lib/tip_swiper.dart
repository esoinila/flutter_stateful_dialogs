import 'package:flutter/material.dart';
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
      if (currentPage < tutorialPagesTop.length - 1) {
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

  String _text = 'Swipe me!';

  void _onHorizontalSwipe(SwipeDirection direction) {
    setState(() {
      if (direction == SwipeDirection.left) {
        cyclePagesForward();
        _text = 'Swiped left!';
        print('Swiped left!');
      } else {
        cyclePagesBackward();
        _text = 'Swiped right!';
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(_text),
                tutorialPagesTop[currentPage],
              ],
            ),
            _currentPageIndicator(),
            tutorialPagesBottom[currentPage],
          ],
        ),
      ),
    ));
  }

  Widget _currentPageIndicator() {
    List<Widget> myWidgetList = [];
    for (int i = 0; i < tutorialPagesTop.length; i++) {
      if (i == currentPage) {
        myWidgetList.add(
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.circle_outlined),
          ),
        );
      } else {
        myWidgetList.add(
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.circle),
          ),
        );
      }
    }
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: myWidgetList);
  }

  final List<Widget> tutorialPagesTop = <Widget>[
    Column(
      children: [
        Text('Tila-ruutu'),
        Image.asset('lib/images/tutorial_1.png', fit: BoxFit.fitHeight, height: 200, width: 200),
        Image.asset('lib/images/Tila.png', fit: BoxFit.fitHeight, height: 60, width: 60),
      ],
    ),
    Column(
      children: [
        Text('Info-ruutu'),
        Image.asset('lib/images/tutorial_2.png', fit: BoxFit.fitHeight, height: 200, width: 200),
        Image.asset('lib/images/Tiedotteet.png', fit: BoxFit.fitHeight, height: 60, width: 60),
      ],
    ),
    Column(
      children: [
        Text('Tuki-ruutu'),
        Image.asset('lib/images/tutorial_3.png', fit: BoxFit.fitHeight, height: 200, width: 200),
        Image.asset('lib/images/Tuki.png', fit: BoxFit.fitHeight, height: 60, width: 60),
      ],
    ),
  ];

  final List<Widget> tutorialPagesBottom = <Widget>[
    Column(
      children: [
        Text('Tila-ruudussa näet verkon tilan ja GeoTrimmiin liittyviä tweettejä.'),
        Text('Tila ruutuun pääset tila-tabista'),
      ],
    ),
    Column(
      children: [
        Text('Info ruudussa voit tutustua Geotrimmin ratkaisuiden käyttökohteisiin.'),
        Text('Info ruutuun pääset info-tabista'),
      ],
    ),
    Column(
      children: [
        Text(
            'Tuki ruudussa on usein kysytyt kysymykset ja voit ottaa yhteyttä meihin kuvien kera.'),
        Text('Tuki ruutuun pääset tuki-tabista'),
      ],
    ),
  ];
}
