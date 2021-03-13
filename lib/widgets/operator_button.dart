import 'package:calculathor/services/button_type.dart';
import 'package:calculathor/services/calculator_stream.dart';
import 'package:calculathor/widgets/calculator_button.dart';
import 'package:flutter/material.dart';

import '../services/color_scheme.dart';

class OperatorButton extends CalculatorButton {
  OperatorButton({
    @required String buttonText,
    Function computationFunction,
    String tooltipText,
    ButtonType buttonType: ButtonType.opBinary,
  })  : assert(buttonText != null && buttonText.length != 0),
        super(
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          onPressed: () => CalculatorStream.streamController.sink.add({
            'dataType': buttonType,
            'data': computationFunction,
            'operatorSymbol': buttonText,
            'operatorDescription': tooltipText,
          }),
          buttonColor: buttonType == ButtonType.opUnary
              ? scientificOperatorButtonColor
              : basicOperatorButtonColor,
          tooltipText: tooltipText,
        );
}
