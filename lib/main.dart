import 'package:flutter/material.dart';

// These are the settings which are toggled by the buttons in the app
bool _digit = false;
bool _hyphen = false;
bool _capital = false;
int _numWords = 3;
TextEditingValue _password = new TextEditingValue(text: 'password');

void main() => runApp(MyApp());

// Main widget of the app
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Password Generator',
      theme: ThemeData(
        primaryColor: Colors.grey[850],
        canvasColor: Colors.grey[700],
        buttonColor: Colors.lightBlue,
        accentColor: Colors.lightBlueAccent,
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
          OptionSection(),
          PasswordSection(),
        ],
      ),
    );
  }
}

// This widget contains the buttons that
// toggle options for the password generator
class OptionSection extends StatefulWidget {
  @override
  _OptionSectionState createState() => _OptionSectionState();
}
class _OptionSectionState extends State<OptionSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SwitchListTile( // toggle for _digit option
            title: const Text('ADD TRAILING DIGIT'),
            value: _digit,
            onChanged: (bool value) { setState(() { _digit = value; }); },
          ),
          SwitchListTile( // toggle for _hyphen option
              title: const Text('ADD RANDOM HYPHEN'),
              value: _hyphen,
              onChanged: (bool value) { setState(() { _hyphen = value; }); },
          ),
          SwitchListTile( // toggle for _capital option
              title: const Text('ADD RANDOM CAPITALIZATION'),
              value: _capital,
              onChanged: (bool value) { setState(() { _capital = value; }); },
          ),
          TextFormField( // text field for _numWords variable
            decoration: const InputDecoration(
              hintText: 'NUMBER OF WORDS IN PASSWORD',
              labelText: 'WORD COUNT',
            ),
            initialValue: '3',
            textAlign: TextAlign.center,
            maxLength: 2,
            keyboardType: TextInputType.number,
            onFieldSubmitted: (String value) { setState(() { _numWords = int.parse(value); }); },
          ),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RaisedButton(
            onPressed: GeneratePassword,
            child: const Text('GENERATE PASSWORD'),
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'GENERATED PASSWORD'),
            controller: TextEditingController.fromValue(_password),
            enableInteractiveSelection: true,
            textAlign: TextAlign.center,
          ),
          // TODO - create a widget for the icon to copy the generated password to the clipboard
        ]
      )
    );
  }

  void GeneratePassword () {
    String _newPassword;

    if (_numWords <= 0) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text("Error: Word Count cannot be less than 1!"),
          backgroundColor: Theme.of(context).errorColor,
        )
      );
    } else {
      _newPassword  = 'password' + _digit.toString() + _hyphen.toString() + _capital.toString() + _numWords.toString();

      setState(() {
        _password = _password.copyWith(text: _newPassword.toString()); // update password text box with new password
      });
    }
  }
}