import 'package:flutter/material.dart';

class SuggestionMoneyWidget extends StatefulWidget {
  const SuggestionMoneyWidget({super.key});

  @override
  State<SuggestionMoneyWidget> createState() => _SuggestionMoneyWidgetState();
}

class _SuggestionMoneyWidgetState extends State<SuggestionMoneyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
      height: 24.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _suggestionMoney('1.000'),
          const SizedBox(width: 4.0),
          _suggestionMoney('10.000'),
          const SizedBox(width: 4.0),
          _suggestionMoney('100.000'),
        ],
      ),
    );
  }

  Expanded _suggestionMoney(String value) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.orange.shade400),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
        child: Text(
          value,
          style:
              TextStyle(color: Colors.orange.shade400, fontSize: 14, height: 0),
        ),
      ),
    );
  }
}
