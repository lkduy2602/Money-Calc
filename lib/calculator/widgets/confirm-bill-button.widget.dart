import 'package:flutter/material.dart';

class ConfirmBillButtonWidget extends StatefulWidget {
  const ConfirmBillButtonWidget({super.key});

  @override
  State<ConfirmBillButtonWidget> createState() =>
      _ConfirmBillButtonWidgetState();
}

class _ConfirmBillButtonWidgetState extends State<ConfirmBillButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 5.0, right: 5.0),
            height: 50.0,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange.shade400,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text('Xác nhận',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      height: 0)),
            ),
          ),
        )
      ],
    );
  }
}
