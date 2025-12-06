import 'package:flutter/material.dart';
import '../widgets/display.dart';
import '../widgets/keypad.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: const SafeArea(
        child: Column(
          children: [
            Expanded(flex: 4, child: Display()),
            Expanded(flex: 7, child: Keypad()),
          ],
        ),
      ),
    );
  }
}
