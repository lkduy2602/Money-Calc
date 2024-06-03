import 'package:flutter/material.dart';
import 'package:money_calc/calculator/widgets/calc-pad.widget.dart';
import 'package:money_calc/calculator/widgets/confirm-bill-button.widget.dart';

class TotalAmountCalculatorWidget extends StatelessWidget {
  const TotalAmountCalculatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        // SuggestionMoneyWidget(),
        // SizedBox(height: 8.0),
        ConfirmBillButtonWidget(),
        SizedBox(height: 8.0),
        CalcPadWidget()
      ],
    );
  }
}
