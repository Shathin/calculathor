import 'package:calculathor/calculator/calculator_button_area.dart';
import 'package:flutter/material.dart';

import 'calculator_screen_area.dart';

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.green,
      width: 610.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CalculatorScreenArea(),
          CalculatorButtonArea(),
        ],
      ),
    );
  }
}
