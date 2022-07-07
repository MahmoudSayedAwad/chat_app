import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({this.Colour, this.title, required this.action});
  final Color? Colour;
  final String? title;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Material(
        elevation: 5,
        color: Colour,
        borderRadius: BorderRadius.circular(30),
        child: MaterialButton(
          onPressed: action,
          minWidth: 200.0,
          height: 42,
          child: Text(
            title!,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
