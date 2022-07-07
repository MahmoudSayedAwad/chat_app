import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const KsendButtonTextStyle = TextStyle(
  color: Color(0xFF00B0FF),
  fontWeight: FontWeight.bold,
  fontSize: 18,
);

const KMessageTextFieldDecoration = InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    hintText: 'Type your Message Here .....',
    border: InputBorder.none);

const KMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(
      color: Color(0xFF00B0FF),
      width: 2,
    ),
  ),
);

final kTextFieldDecoration = InputDecoration(
  hintText: "Enter your Email",
  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(32),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.lightBlueAccent,
      width: 2,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(32),
    ),
  ),
);
