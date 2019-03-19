import 'package:flutter/material.dart';
import 'generate_password.dart';
import 'actions.dart';
import 'password_box.dart';

// These are the settings which are toggled in ButtonSection()
bool _digit = false;
bool _hyphen = false;
bool _capital = false;

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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ButtonSection(),
          ActionSection(),
          PasswordSection(),
        ],
      ),
    );
  }
}

// This widget contains the buttons that
// toggle options for the password generator
class ButtonSection extends StatefulWidget {
  @override
  _ButtonSectionState createState() => _ButtonSectionState();
}
class _ButtonSectionState extends State<ButtonSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SwitchListTile(
                title: const Text('ADD TRAILING DIGIT'),
                value: _digit,
                onChanged: (bool value) { setState(() { _digit = value; }); },
              ),
              SwitchListTile(
                  title: const Text('ADD RANDOM HYPHEN'),
                  value: _hyphen,
                  onChanged: (bool value) { setState(() { _hyphen = value; }); },
              ),
              SwitchListTile(
                  title: const Text('ADD RANDOM CAPITALIZATION'),
                  value: _capital,
                  onChanged: (bool value) { setState(() { _capital = value; }); },
              ),
            ]
        )
    );
  }
}

// This widget contains the dial for the number of words
// in the password and the "generate password" button
class ActionSection extends StatefulWidget {
  @override
  _ActionSectionState createState() => _ActionSectionState();
}
class _ActionSectionState extends State<ActionSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // TODO - create a widget for the number dial for the number of words in the password
          // TODO - create a widget for the generate password button
        ]
      )
    );
  }
}

class PasswordSection extends StatefulWidget {
  @override
  _PasswordSectionState createState() => _PasswordSectionState();
}
class _PasswordSectionState extends State<PasswordSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // TODO - create a widget for the text box that contains the generated password
          // TODO - create a widget for the icon to copy the generated password to the clipboard
        ]
      )
    );
  }
}