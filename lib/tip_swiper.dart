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
      if (currentPage < tutorialPages.length - 1) {
        currentPage++;
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

  void _onVerticalSwipe(SwipeDirection direction) {
    setState(() {
      if (direction == SwipeDirection.up) {
        _text = 'Swiped up!';
        print('Swiped up!');
      } else {
        _text = 'Swiped down!';
        print('Swiped down!');
      }
    });
  }

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

  void _onLongPress() {
    setState(() {
      _text = 'Long pressed!';
      print('Long pressed!');
    });
  }

  void _onTap() {
    setState(() {
      _text = 'Tapped!';
      print('Tapped!');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SimpleGestureDetector(
      onVerticalSwipe: _onVerticalSwipe,
      onHorizontalSwipe: _onHorizontalSwipe,
      onLongPress: _onLongPress,
      onTap: _onTap,
      swipeConfig: SimpleSwipeConfig(
        verticalThreshold: 40.0,
        horizontalThreshold: 40.0,
        swipeDetectionBehavior: SwipeDetectionBehavior.continuousDistinct,
      ),
      child: Column(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(_text),
              tutorialPages[currentPage],
            ],
          ),
          Row(
            children: [
              TextButton(
                child: Text('Edellinen'),
                onPressed: () {
                  setState(() {
                    cyclePagesBackward();
                    print('currentInfo is $currentPage');
                  });
                },
              ),
              TextButton(
                child: Text('Seuraava'),
                onPressed: () {
                  setState(() {
                    cyclePagesForward();
                    print('currentInfo is $currentPage');
                  });
                },
              ),
              TextButton(
                child: Text('Sulje Dialogi'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ],
      ),
    ));
  }

  final List<Widget> tutorialPages = <Widget>[
    Column(
      children: [
        Text('Tila-ruutu'),
        Image.asset('lib/images/tutorial_1.png', fit: BoxFit.fitHeight, height: 200, width: 200),
        Text('Tila-ruudussa näet verkon tilan ja GeoTrimmiin liittyviä tweettejä.'),
        Text('Tila ruutuun pääset tila-tabista'),
        Image.asset('lib/images/Tila.png', fit: BoxFit.fitHeight, height: 60, width: 60),
      ],
    ),
    Column(
      children: [
        Text('Info-ruutu'),
        Image.asset('lib/images/tutorial_2.png', fit: BoxFit.fitHeight, height: 200, width: 200),
        Text('Info ruudussa voit tutustua Geotrimmin ratkaisuiden käyttökohteisiin.'),
        Text('Info ruutuun pääset info-tabista'),
        Image.asset('lib/images/Tiedotteet.png', fit: BoxFit.fitHeight, height: 60, width: 60),
      ],
    ),
    Column(
      children: [
        Text('Tuki-ruutu'),
        Image.asset('lib/images/tutorial_3.png', fit: BoxFit.fitHeight, height: 200, width: 200),
        Text(
            'Tuki ruudussa on usein kysytyt kysymykset ja voit ottaa yhteyttä meihin kuvien kera.'),
        Text('Tuki ruutuun pääset tuki-tabista'),
        Image.asset('lib/images/Tuki.png', fit: BoxFit.fitHeight, height: 60, width: 60),
      ],
    ),
  ];
}
