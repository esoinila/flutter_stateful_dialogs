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

  //List<Widget> myContent = <Widget>[Text('First info'), Text('Second info'), Text('Third info')];
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
          final TextEditingController _textEditingController = TextEditingController();
          bool isChecked = false;
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      tutorialPages[currentPage],
                      //Text('Just testing'),
                      TextFormField(
                        controller: _textEditingController,
                        validator: (value) {
                          return value.isNotEmpty ? null : "Invalid Field";
                        },
                        decoration: InputDecoration(hintText: "Enter Some Text"),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Choice Box"),
                          Checkbox(
                              value: isChecked,
                              onChanged: (checked) {
                                setState(() {
                                  isChecked = checked;
                                });
                              })
                        ],
                      )
                    ],
                  )),
              actions: <Widget>[
                TextButton(
                  child: Text('Okay'),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      // Do something like updating SharedPreferences or User Settings etc.
                      Navigator.of(context).pop();
                    }
                  },
                ),
                TextButton(
                  child: Text('Previous'),
                  onPressed: () {
                    // Do something like updating SharedPreferences or User Settings etc.
                    setState(() {
                      currentPage--;
                      print('currentInfo is $currentPage');
                    });
                  },
                ),
                TextButton(
                  child: Text('Next'),
                  onPressed: () {
                    // Do something like updating SharedPreferences or User Settings etc.
                    setState(() {
                      currentPage++;
                      print('currentInfo is $currentPage');
                    });
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
        Text('First page of tutorial'),
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
          child: FlatButton(
              color: Colors.deepOrange,
              onPressed: () async {
                await showInformationDialog(context);
              },
              child: Text(
                "Stateful Dialog",
                style: TextStyle(color: Colors.white, fontSize: 16),
              )),
        ),
      ),
    );
  }
}
