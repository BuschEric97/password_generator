import 'package:flutter/material.dart';
import 'buttons.dart';
import 'generate_password.dart';

void main() => runApp(MyApp());

// Main widget of the app
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Password Generator',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: MyHomePage(),
    );
  }
}

// This widget is the main body of the app
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Password Generator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buttonSection(),
          // TODO - create a section for the password length toggle and generate password button
          // TODO - create a section to display the generated password
        ],
      ),
    );
  }
}

// This widget contains the buttons that
// toggle options for the password generator
class buttonSection extends StatefulWidget {
  @override
  _ButtonSectionState createState() => _ButtonSectionState();
}
class _ButtonSectionState extends State<buttonSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DigitWidget(),
              HyphenWidget(),
              CapitalWidget(),
            ]
        )
    );
  }
}