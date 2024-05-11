import 'package:flutter/material.dart';

class CalcPadWidget extends StatelessWidget {
  const CalcPadWidget({super.key});

  final double calcButtonSpacing = 4.0;

  calcButtonPressed(String buttonValue) {}

  Expanded calcButton(String value, int flex, Color buttonColor,
      Function()? calcButtonPressed) {
    return Expanded(
      flex: flex,
      child: Container(
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8.0,
            )
          ]),
          child: ElevatedButton(
            onPressed: calcButtonPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor,
              minimumSize: const Size(999999, 999999),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: Text(value,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    height: 0)),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                calcButton('AC', 1, Colors.grey.shade300,
                    () => calcButtonPressed('AC')),
                SizedBox(
                  width: calcButtonSpacing,
                ),
                calcButton(
                    '÷', 1, Colors.grey.shade300, () => calcButtonPressed('/')),
                SizedBox(
                  width: calcButtonSpacing,
                ),
                calcButton(
                    '×', 1, Colors.grey.shade300, () => calcButtonPressed('*')),
                SizedBox(
                  width: calcButtonSpacing,
                ),
                calcButton(
                    '⌫', 1, Colors.grey.shade300, () => calcButtonPressed('⌫')),
              ],
            ),
          ),
          SizedBox(
            height: calcButtonSpacing,
          ),
          Expanded(
            child: Row(
              children: [
                calcButton('7', 1, Colors.white, () => calcButtonPressed('7')),
                SizedBox(
                  width: calcButtonSpacing,
                ),
                calcButton('8', 1, Colors.white, () => calcButtonPressed('8')),
                SizedBox(
                  width: calcButtonSpacing,
                ),
                calcButton('9', 1, Colors.white, () => calcButtonPressed('9')),
                SizedBox(
                  width: calcButtonSpacing,
                ),
                calcButton(
                    '-', 1, Colors.grey.shade300, () => calcButtonPressed('-')),
              ],
            ),
          ),
          SizedBox(
            height: calcButtonSpacing,
          ),
          Expanded(
            child: Row(
              children: [
                calcButton('4', 1, Colors.white, () => calcButtonPressed('4')),
                SizedBox(
                  width: calcButtonSpacing,
                ),
                calcButton('5', 1, Colors.white, () => calcButtonPressed('5')),
                SizedBox(
                  width: calcButtonSpacing,
                ),
                calcButton('6', 1, Colors.white, () => calcButtonPressed('6')),
                SizedBox(
                  width: calcButtonSpacing,
                ),
                calcButton(
                    '+', 1, Colors.grey.shade300, () => calcButtonPressed('+')),
              ],
            ),
          ),
          SizedBox(
            height: calcButtonSpacing,
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Expanded(
                            child: Row(
                          children: [
                            calcButton('1', 1, Colors.white,
                                () => calcButtonPressed('1')),
                            SizedBox(
                              width: calcButtonSpacing,
                            ),
                            calcButton('2', 1, Colors.white,
                                () => calcButtonPressed('2')),
                            SizedBox(
                              width: calcButtonSpacing,
                            ),
                            calcButton('3', 1, Colors.white,
                                () => calcButtonPressed('3')),
                          ],
                        )),
                        SizedBox(
                          height: calcButtonSpacing,
                        ),
                        Expanded(
                            child: Row(
                          children: [
                            calcButton('000', 2, Colors.white,
                                () => calcButtonPressed('000')),
                            SizedBox(
                              width: calcButtonSpacing,
                            ),
                            calcButton('0', 1, Colors.white,
                                () => calcButtonPressed('0')),
                          ],
                        ))
                      ],
                    )),
                SizedBox(
                  width: calcButtonSpacing,
                ),
                calcButton(
                    '=', 1, Colors.grey.shade300, () => calcButtonPressed('=')),
              ],
            ),
          )
        ],
      ),
    );
  }
}
