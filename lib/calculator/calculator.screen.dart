import 'package:flutter/material.dart';
import 'package:money_calc/calculator/widgets/calc-display.widget.dart';
import 'package:money_calc/calculator/widgets/total-amount-calculator.widget.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: CalcDisplayWidget(),
        ),
        SizedBox(height: 20.0),
        Expanded(
          child: TotalAmountCalculatorWidget(),
        ),
      ],
    );
  }
}
