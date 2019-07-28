import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:math';

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

  void GeneratePassword () async {
    String _newPassword;
    Random rnd = new Random();
    int hyphenIndex = rnd.nextInt(_numWords - 1);

    if (_numWords <= 0) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text("Error: Word Count cannot be less than 1!"),
          backgroundColor: Theme.of(context).errorColor,
        )
      );
    } else {
      _newPassword = await GetRandomString(); // put an initial word in the password

      // put additional words into the password if necessary
      for (int i = 0; i < _numWords; i++) {
        _newPassword =  _newPassword + await GetRandomString();
        if (_hyphen && i == hyphenIndex) // add a hyphen at hyphenIndex if option was selected
          _newPassword = _newPassword + '-';
        else if (i != _numWords - 1) // else add an underscore
          _newPassword = _newPassword + '_';
      }

      // add a random digit at the end of the password if the option was selected
      if (_digit)
        _newPassword = _newPassword + '_' + rnd.nextInt(9).toString();

      // capitalize a random letter (if applicable) if the option was selected
      if (_capital)
        _newPassword = RandomCapital(_newPassword);

      setState(() {
        _password = _password.copyWith(text: _newPassword.toString()); // update password text box with new password
      });
    }
  }

  // Uses the file "Wordlist.txt" in assets
  // to find and return the next random string
  Future<String> GetRandomString () async {
    // generate the random number used
    // to get the next random word
    Random rnd = new Random();
    int fileIndex = rnd.nextInt(7775);

    // get the next random word
    String fileText = await rootBundle.loadString('assets/Wordlist.txt');
    List<String> wordList = fileText.split("\n");
    List<String> wordListLine = wordList[fileIndex].split("\t");
    String randWord = wordListLine[1];

    // return the next random word
    return randWord;
  }

  // randomly capitalize one of the letters in the given string
  // and return the new string. If there are no letters in the
  // string, return the string unmodified.
  String RandomCapital (String str) {
    String newStr;
    Random rnd = new Random();

    // if the input string does not contain any
    // letters, then return it unmodified
    if (!str.contains(new RegExp(r'[a-z]')))
      return str;

    // randomly capitalize one of the letters in the string
    while (true) {
      int randomChar = rnd.nextInt(str.length-1);

      // capitalize the letter at index randomChar
      if (randomChar == str.length-1) {
        newStr = str.substring(0, randomChar) + str.substring(randomChar);
      } else {
        newStr = str.substring(0, randomChar)
            + str.substring(randomChar, randomChar + 1).toUpperCase()
            + str.substring(randomChar + 1);
      }

      // if the character at index randomChar was in
      // fact a letter, then break out of the loop
      if (str.substring(randomChar, randomChar + 1).contains(new RegExp(r'[a-z]')))
        break;
    }

    return newStr;
  }
}