import 'package:flutter/material.dart';

import 'tip_swiper.dart';

void main() {
  runApp(StateFullWidgetTestApp());
}

class StateFullWidgetTestApp extends StatelessWidget {
  // This widget is the root of your application.
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Tutoriaali Demo"),
      ),
      body: Container(
        child: Center(child: TipSwiper()

            /*TextButton(
              onPressed: () async {
                await showInformationDialog(context);
              },
              child: Text(
                "Avaa Tutoriaali",
                style: TextStyle(color: Colors.black, fontSize: 16),
              )),*/
            ),
      ),
    );
  }
}
