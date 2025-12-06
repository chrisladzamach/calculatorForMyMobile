import 'package:flutter/material.dart';

class CalculatorButtons {
  static final List<Widget> items = [
    _text("AC"),
    _text("()"),
    _text("%"),
    _text("÷"),
    _text("7"),
    _text("8"),
    _text("9"),
    _text("*"),
    _text("4"),
    _text("5"),
    _text("6"),
    _text("-"),
    _text("1"),
    _text("2"),
    _text("3"),
    _text("+"),
    _text("."),
    _text("0", fontSize: 20),
    const Icon(Icons.backspace_rounded, color: Colors.white),
    _text("=", fontSize: 20),
  ];

  static Text _text(String value, {double fontSize = 28}) {
    return Text(
      value,
      style: TextStyle(
        color: Colors.white,
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
