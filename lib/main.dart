import 'package:flutter/material.dart';
import 'package:flutter_translation_app/HistoryPage.dart';
import 'package:flutter_translation_app/RandomNumberObject.dart';
import 'package:flutter_translation_app/randomNumberApi.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random number generator',
      routes: {
        '/history': (context) => HistoryPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  RandomNumberObject randomNumberObject;
  SharedPreferences prefs;
  List<RandomNumberObject> previousNumbers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Random number Generator"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ElevatedButton(
                child: Text("Generate"),
                onPressed: () async {
                  randomNumberObject = (await fetchRandomNumber());
                  //prefs.setString(DateTime.now().toString(), randomNumberObject.result);
                  setState(() {
                    previousNumbers.add(randomNumberObject);
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Text(randomNumberObject?.result ?? ""),
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: Colors.grey,
              ),
              ElevatedButton(child: Text('History'), onPressed: () {
                Navigator.of(context).pushNamed('/history');
              },)

            ],
          ),
        ),
      ),
    );
  }
}




class RandomNumberHistoryWidget extends StatelessWidget {
  final RandomNumberObject randomNumberObject;

  const RandomNumberHistoryWidget({Key key, @required this.randomNumberObject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Column(
        children: [
          Text('Translation: ${randomNumberObject.result}')
        ],
      ),
    );
  }
}