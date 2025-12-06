import 'package:flutter/material.dart';
// import 'dart:math';

class CalculatorController extends ChangeNotifier {
  String _expression = "";
  String _result = "0";

  String get expression => _expression;
  String get result => _result;

  void input(String value) {
    if (value == "AC") {
      _expression = "";
      _result = "0";
      notifyListeners();
      return;
    }

    if (value == "BACK") {
      if (_expression.isNotEmpty) {
        _expression = _expression.substring(0, _expression.length - 1);
      }
      notifyListeners();
      return;
    }

    if (value == "=") {
      try {
        final calc = _expression
            .replaceAll("*", "*")
            .replaceAll("÷", "/");

        _result = _evaluate(calc).toString();
      } catch (_) {
        _result = "Error";
      }

      notifyListeners();
      return;
    }

    _expression += value;
    notifyListeners();
  }

  double _evaluate(String exp) {

    return _parseExpression(exp);
  }

  double _parseExpression(String exp) {
    final addition = exp.split(RegExp(r'(?=\+)|(?=\-)'));
    double total = _parseTerm(addition[0]);

    for (int i = 1; i < addition.length; i++) {
      final item = addition[i];
      if (item.startsWith("+")) {
        total += _parseTerm(item.substring(1));
      } else if (item.startsWith("-")) {
        total -= _parseTerm(item.substring(1));
      }
    }
    return total;
  }

  double _parseTerm(String exp) {
    final mult = exp.split(RegExp(r'(?=\*)|(?=/)'));
    double value = _parseNumber(mult[0]);

    for (int i = 1; i < mult.length; i++) {
      final item = mult[i];
      if (item.startsWith("*")) {
        value *= _parseNumber(item.substring(1));
      } else if (item.startsWith("/")) {
        value /= _parseNumber(item.substring(1));
      }
    }
    return value;
  }

  double _parseNumber(String exp) {
    return double.tryParse(exp) ?? 0.0;
  }
}
