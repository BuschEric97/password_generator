import 'package:flutter/material.dart';

// This widget is the button to control whether or not
// to add a trailing digit to the end of the password
class DigitWidget extends StatefulWidget {
  @override
  _DigitWidgetState createState() => _DigitWidgetState();
}
class _DigitWidgetState extends State<DigitWidget> {
  bool _isToggled = false; // actual boolean value for the button; off by default
  Color color;

  @override
  Widget build(BuildContext context) {
    color = Theme.of(context).primaryColor;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        // The button itself
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_isToggled ? Icon(Icons.radio_button_checked) : Icon(Icons.radio_button_unchecked)),
            color: color,
            onPressed: _toggleDigit,
          ),
        ),

        // The text underneath the button
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            "TRAILING DIGIT",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  // toggle the button state when called
  void _toggleDigit() {
    setState(() {
      if (_isToggled) {
        _isToggled = false;
      } else {
        _isToggled = true;
      }
    });
  }
}

// This widget is the button to control whether or not to add
// a hyphen randomly in place of an underscore in the password
class HyphenWidget extends StatefulWidget {
  @override
  _HyphenWidgetState createState() => _HyphenWidgetState();
}
class _HyphenWidgetState extends State<HyphenWidget> {
  bool _isToggled = false; // actual boolean value for the button; off by default
  Color color;

  @override
  Widget build(BuildContext context) {
    color = Theme.of(context).primaryColor;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        // The button itself
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_isToggled ? Icon(Icons.radio_button_checked) : Icon(Icons.radio_button_unchecked)),
            color: color,
            onPressed: _toggleHyphen,
          ),
        ),

        // The text underneath the button
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            "ROGUE HYPHEN",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  // toggle the button state when called
  void _toggleHyphen() {
    setState(() {
      if (_isToggled) {
        _isToggled = false;
      } else {
        _isToggled = true;
      }
    });
  }
}

// This widget is the button to control whether or not to
// randomly capitalize one of the words in the password
class CapitalWidget extends StatefulWidget {
  @override
  _CapitalWidgetState createState() => _CapitalWidgetState();
}
class _CapitalWidgetState extends State<CapitalWidget> {
  bool _isToggled = false; // actual boolean value for the button; off by default
  Color color;

  @override
  Widget build(BuildContext context) {
    color = Theme.of(context).primaryColor;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        // The button itself
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_isToggled ? Icon(Icons.radio_button_checked) : Icon(Icons.radio_button_unchecked)),
            color: color,
            onPressed: _toggleCapital,
          ),
        ),

        // The text underneath the button
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            "ROGUE CAPITAL",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  // toggle the button state when called
  void _toggleCapital() {
    setState(() {
      if (_isToggled) {
        _isToggled = false;
      } else {
        _isToggled = true;
      }
    });
  }
}