import 'package:calculathor/services/button_type.dart';
import 'package:calculathor/services/calculator_stream.dart';
import 'package:calculathor/widgets/calculator_button.dart';
import 'package:flutter/material.dart';

import '../services/color_scheme.dart';

class OperatorButton extends CalculatorButton {
  OperatorButton({
    @required String btnText,
    Function computationFunction,
    String tooltipText,
    ButtonType btnType: ButtonType.opBinary,
  })  : assert(btnText != null && btnText.length != 0),
        super(
          child: Text(
            btnText,
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          onPressed: () => CalculatorStream.streamController.sink.add({
            'dataType': btnType,
            'data': computationFunction,
            'operatorSymbol': btnText,
            'operatorDescription': tooltipText,
          }),
          btnColor: btnType == ButtonType.opUnary
              ? scientificOperatorButtonColor
              : basicOperatorButtonColor,
          tooltipText: tooltipText,
        );
}
