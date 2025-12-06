import 'package:calculator_for_my_phone/logic/calculatos_controllers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/calculator_buttons.dart';
import '../../core/calculator_colors.dart';

class Keypad extends StatelessWidget {
  const Keypad({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CalculatorController>();

    return Container(
      color: Colors.black,
      padding: const EdgeInsets.all(8),
      child: GridView.builder(
        itemCount: CalculatorButtons.items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 20,
          mainAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          final widget = CalculatorButtons.items[index];
          final label = _extractValue(widget);

          return GestureDetector(
            onTap: () {
              if (label == "BACK") {
                controller.input("BACK");
              } else {
                controller.input(label);
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: CalculatorColors.keypadColors[index],
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(child: widget),
            ),
          );
        },
      ),
    );
  }

  String _extractValue(Widget w) {
    if (w is Text) return w.data ?? "";
    if (w is Icon) return "BACK";
    return "";
  }
}
