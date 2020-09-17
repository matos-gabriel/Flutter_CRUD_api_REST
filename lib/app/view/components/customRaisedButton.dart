import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;

  CustomRaisedButton({
    @required this.text,
    @required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      textColor: Colors.white,
      color: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
