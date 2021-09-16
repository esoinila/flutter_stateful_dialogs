import 'package:flutter/material.dart';

import 'tip_swiper.dart';

void main() {
  runApp(StateFullWidgetTestApp());
}

class StateFullWidgetTestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newTextTheme = Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white10,
        );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StateFullWidgetTestApp',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        textTheme: newTextTheme,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> showInformationDialog(BuildContext context) async {
    return await showDialog(
        barrierColor: Colors.white30,
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Colors.black,
              content: TipSwiper(),
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AlertDialog with state"),
      ),
      body: Container(
        child: Center(
          child: TextButton(
              onPressed: () async {
                await showInformationDialog(context);
              },
              child: Text(
                "Avaa Dialogi",
                style: TextStyle(color: Colors.white, fontSize: 16),
              )),
        ),
      ),
    );
  }
}
