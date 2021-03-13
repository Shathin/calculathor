import 'package:calculathor/services/button_type.dart';
import 'package:calculathor/services/calculator_stream.dart';
import 'package:calculathor/services/color_scheme.dart';
import 'package:calculathor/services/computation_functions.dart';
import 'package:calculathor/widgets/calculator_button.dart';
import 'package:calculathor/widgets/number_button.dart';
import 'package:calculathor/widgets/operator_button.dart';
import 'package:flutter/material.dart';

class CalculatorButtonArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: calculatorBackgroundColor,
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildBasicCalculatorButtonBlock(),
          _buildScientificCalculatorButtonBlock(),
          _buildEditContentBlock(),
        ],
      ),
    );
  }

  Widget _buildBasicCalculatorBlockButtonRow({
    @required Widget button1,
    @required Widget button2,
    @required Widget button3,
    @required Widget button4,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        button1,
        button2,
        button3,
        button4,
      ],
    );
  }

  Widget _buildBasicCalculatorButtonBlock() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buildBasicCalculatorBlockButtonRow(
          button1: NumberButton(buttonText: '9', tooltipText: 'Number 9'),
          button2: NumberButton(buttonText: '8', tooltipText: 'Number 8'),
          button3: NumberButton(buttonText: '7', tooltipText: 'Number 7'),
          button4: OperatorButton(
            buttonText: '+',
            computationFunction: addition,
            tooltipText: 'Addition',
            buttonType: ButtonType.opBinary,
          ),
        ),
        _buildBasicCalculatorBlockButtonRow(
          button1: NumberButton(buttonText: '6', tooltipText: 'Number 6'),
          button2: NumberButton(buttonText: '5', tooltipText: 'Number 5'),
          button3: NumberButton(buttonText: '4', tooltipText: 'Number 4'),
          button4: OperatorButton(
            buttonText: '-',
            computationFunction: subtraction,
            tooltipText: 'Subtraction',
            buttonType: ButtonType.opBinary,
          ),
        ),
        _buildBasicCalculatorBlockButtonRow(
          button1: NumberButton(buttonText: '3', tooltipText: 'Number 3'),
          button2: NumberButton(buttonText: '2', tooltipText: 'Number 2'),
          button3: NumberButton(buttonText: '1', tooltipText: 'Number 1'),
          button4: OperatorButton(
            buttonText: '÷',
            computationFunction: division,
            tooltipText: 'Divison',
            buttonType: ButtonType.opBinary,
          ),
        ),
        _buildBasicCalculatorBlockButtonRow(
          button1: NumberButton(buttonText: '.', tooltipText: 'Decimal point'),
          button2: NumberButton(buttonText: '0', tooltipText: 'Number 1'),
          button3: OperatorButton(
            buttonText: '=',
            tooltipText: 'Evaluate',
            buttonType: ButtonType.opEvaluate,
          ),
          button4: OperatorButton(
            buttonText: '*',
            computationFunction: multiplication,
            tooltipText: 'Multiplication',
            buttonType: ButtonType.opBinary,
          ),
        ),
      ],
    );
  }

  Widget _buildScientificCalculatorButtonBlock() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        OperatorButton(
          buttonText: '√x',
          computationFunction: squareRoot,
          buttonType: ButtonType.opUnary,
          tooltipText: 'Square root',
        ),
        OperatorButton(
          buttonText: 'x!',
          computationFunction: factorial,
          buttonType: ButtonType.opUnary,
          tooltipText: 'Factorial',
        ),
        OperatorButton(
          buttonText: 'ln(x)',
          computationFunction: naturalLog,
          buttonType: ButtonType.opUnary,
          tooltipText: 'Natural Logarithm',
        ),
        OperatorButton(
          buttonText: 'x^y',
          computationFunction: power,
          buttonType: ButtonType.opBinary,
          tooltipText: 'Power',
        ),
      ],
    );
  }

  Widget _buildEditContentBlock() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CalculatorButton(
          child: Icon(Icons.backspace),
          tooltipText: 'Backspace',
          onPressed: () => CalculatorStream.streamController.sink.add({
            'dataType': ButtonType.backspace,
          }),
          buttonColor: editButtonColor,
        ),
        CalculatorButton(
          child: Icon(Icons.delete_forever),
          tooltipText: 'Erase screen content',
          onPressed: () => CalculatorStream.streamController.sink.add({
            'dataType': ButtonType.clear,
          }),
          buttonColor: editButtonColor,
        ),
      ],
    );
  }
}
