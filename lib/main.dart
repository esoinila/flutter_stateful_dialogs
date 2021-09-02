import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int currentPage = 0;

  void cyclePagesForward() {
    print('Forward');
    setState(() {
      if (currentPage < tutorialPages.length - 1) {
        currentPage++;
      } else {
        currentPage = 0;
      }
    });
  }

  void cyclePagesBackward() {
    print('Backward');
    setState(() {
      if (currentPage > 0) {
        currentPage--;
      } else {
        currentPage = tutorialPages.length - 1;
      }
    });
  }

  Future<void> showInformationDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      tutorialPages[currentPage],
                    ],
                  )),
              actions: <Widget>[
                TextButton(
                  child: Text('Previous'),
                  onPressed: () {
                    setState(() {
                      cyclePagesBackward();
                      print('currentInfo is $currentPage');
                    });
                  },
                ),
                TextButton(
                  child: Text('Next'),
                  onPressed: () {
                    setState(() {
                      cyclePagesForward();
                      print('currentInfo is $currentPage');
                    });
                  },
                ),
                TextButton(
                  child: Text('Dismiss'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
        });
  }

  final List<Widget> tutorialPages = <Widget>[
    Column(
      children: [
        Text('Tila-ruutu'),
        Image.asset('lib/images/tutorial_1.png', fit: BoxFit.fitHeight, height: 200, width: 200),
        Text('Tila-ruudussa näet verkon tilan ja GeoTrimmiin liittyviä tweettejä.'),
        Text('Tila ruutuun pääset tila-tabista'),
        Image.asset('lib/images/Tila.png', fit: BoxFit.fitHeight, height: 60, width: 60),
        Icon(
          Icons.record_voice_over_rounded,
          size: 24.0,
        ),
      ],
    ),
    Column(
      children: [
        Text('Second page of tutorial'),
        Icon(
          Icons.airline_seat_individual_suite,
          size: 24.0,
        ),
      ],
    ),
    Column(
      children: [
        Text('Third page of tutorial'),
        Icon(
          Icons.donut_small_rounded,
          size: 24.0,
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stateful Dialog"),
      ),
      body: Container(
        child: Center(
          child: TextButton(
              //color: Colors.deepOrange,
              onPressed: () async {
                await showInformationDialog(context);
              },
              child: Text(
                "Stateful Dialog",
                style: TextStyle(color: Colors.black, fontSize: 16),
              )),
        ),
      ),
    );
  }
}
