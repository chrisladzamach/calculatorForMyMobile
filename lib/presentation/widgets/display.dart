import 'package:calculator_for_my_phone/logic/calculatos_controllers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Display extends StatelessWidget {
  const Display({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CalculatorController>();

    return Container(
      color: Colors.black,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            controller.expression,
            style: const TextStyle(
              fontSize: 40,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            controller.result,
            style: const TextStyle(
              fontSize: 65,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
