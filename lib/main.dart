import 'package:flutter/material.dart';

void main() {
  runApp(StateFullWidgetTestApp());
}

class StateFullWidgetTestApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StateFullWidgetTestApp',
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
    setState(() {
      if (currentPage < tutorialPages.length - 1) {
        currentPage++;
      } else {
        //currentPage = 0;
      }
    });
  }

  void cyclePagesBackward() {
    setState(() {
      if (currentPage > 0) {
        currentPage--;
      } else {
        //currentPage = tutorialPages.length - 1;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tutoriaali Demo"),
      ),
      body: Container(
        child: Center(
          child: TextButton(
              onPressed: () async {
                await showInformationDialog(context);
              },
              child: Text(
                "Avaa Tutoriaali",
                style: TextStyle(color: Colors.black, fontSize: 16),
              )),
        ),
      ),
    );
  }
}
