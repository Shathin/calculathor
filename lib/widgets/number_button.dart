import 'package:calculathor/services/button_type.dart';
import 'package:calculathor/services/calculator_stream.dart';
import 'package:calculathor/widgets/calculator_button.dart';
import 'package:flutter/material.dart';

import '../services/color_scheme.dart';

class NumberButton extends CalculatorButton {
  NumberButton({
    @required String buttonText,
    String tooltipText,
  })  : assert(buttonText != null && buttonText.length != 0),
        super(
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          onPressed: () => CalculatorStream.streamController.sink.add({
            'dataType': ButtonType.operand,
            'data': buttonText,
          }),
          buttonColor: numberButtonColor,
          tooltipText: tooltipText,
        );
}
