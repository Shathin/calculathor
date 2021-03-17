import 'package:calculathor/services/button_type.dart';
import 'package:calculathor/services/calculator_stream.dart';
import 'package:calculathor/services/color_scheme.dart';
import 'package:calculathor/services/computation_functions.dart';
import 'package:calculathor/widgets/calculator_button.dart';
import 'package:calculathor/widgets/number_button.dart';
import 'package:calculathor/widgets/operator_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalculatorButtonArea extends StatelessWidget {
  final CalculatorButton digit9 =
      NumberButton(btnText: '9', tooltipText: 'Number 9');
  final CalculatorButton digit8 =
      NumberButton(btnText: '8', tooltipText: 'Number 8');
  final CalculatorButton digit7 =
      NumberButton(btnText: '7', tooltipText: 'Number 7');
  final CalculatorButton digit6 =
      NumberButton(btnText: '6', tooltipText: 'Number 6');
  final CalculatorButton digit5 =
      NumberButton(btnText: '5', tooltipText: 'Number 5');
  final CalculatorButton digit4 =
      NumberButton(btnText: '4', tooltipText: 'Number 4');
  final CalculatorButton digit3 =
      NumberButton(btnText: '3', tooltipText: 'Number 3');
  final CalculatorButton digit2 =
      NumberButton(btnText: '2', tooltipText: 'Number 2');
  final CalculatorButton digit1 =
      NumberButton(btnText: '1', tooltipText: 'Number 1');
  final CalculatorButton digit0 =
      NumberButton(btnText: '0', tooltipText: 'Number 0');
  final CalculatorButton decimal =
      NumberButton(btnText: '.', tooltipText: 'Decimal');
  final CalculatorButton operatorAdd = OperatorButton(
    btnText: '+',
    computationFunction: addition,
    tooltipText: 'Addition',
    btnType: ButtonType.opBinary,
  );
  final CalculatorButton operatorSub = OperatorButton(
    btnText: '-',
    computationFunction: subtraction,
    tooltipText: 'Subtraction',
    btnType: ButtonType.opBinary,
  );
  final CalculatorButton operatorDiv = OperatorButton(
    btnText: '÷',
    computationFunction: division,
    tooltipText: 'Divison',
    btnType: ButtonType.opBinary,
  );
  final CalculatorButton operatorMul = OperatorButton(
    btnText: '*',
    computationFunction: multiplication,
    tooltipText: 'Multiplication',
    btnType: ButtonType.opBinary,
  );
  final CalculatorButton operatorSqrt = OperatorButton(
    btnText: '√x',
    computationFunction: squareRoot,
    btnType: ButtonType.opUnary,
    tooltipText: 'Square root',
  );
  final CalculatorButton operatorFact = OperatorButton(
    btnText: 'x!',
    computationFunction: factorial,
    btnType: ButtonType.opUnary,
    tooltipText: 'Factorial',
  );
  final CalculatorButton operatorLn = OperatorButton(
    btnText: 'ln(x)',
    computationFunction: naturalLog,
    btnType: ButtonType.opUnary,
    tooltipText: 'Natural Logarithm',
  );
  final CalculatorButton operatorExp = OperatorButton(
    btnText: 'x^y',
    computationFunction: power,
    btnType: ButtonType.opBinary,
    tooltipText: 'Power',
  );
  final CalculatorButton evaluate = OperatorButton(
    btnText: '=',
    tooltipText: 'Evaluate',
    btnType: ButtonType.opEvaluate,
  );
  final CalculatorButton backspace = CalculatorButton(
    child: Icon(Icons.backspace),
    tooltipText: 'Backspace',
    onPressed: () => CalculatorStream.streamController.sink.add({
      'dataType': ButtonType.backspace,
    }),
    btnColor: editButtonColor,
  );
  final CalculatorButton clear = CalculatorButton(
    child: Icon(Icons.delete_forever),
    tooltipText: 'Erase screen content',
    onPressed: () => CalculatorStream.streamController.sink.add({
      'dataType': ButtonType.clear,
    }),
    btnColor: editButtonColor,
  );

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: FocusNode(),
      autofocus: true,
      onKey: (RawKeyEvent keyEvent) {
        if (keyEvent.isKeyPressed(LogicalKeyboardKey.digit0) ||
            keyEvent.isKeyPressed(LogicalKeyboardKey.numpad0))
          digit0.onPressed();
        else if (keyEvent.isKeyPressed(LogicalKeyboardKey.digit1) ||
            keyEvent.isKeyPressed(LogicalKeyboardKey.numpad1))
          digit1.onPressed();
        else if (keyEvent.isKeyPressed(LogicalKeyboardKey.digit2) ||
            keyEvent.isKeyPressed(LogicalKeyboardKey.numpad2))
          digit2.onPressed();
        else if (keyEvent.isKeyPressed(LogicalKeyboardKey.digit3) ||
            keyEvent.isKeyPressed(LogicalKeyboardKey.numpad3))
          digit3.onPressed();
        else if (keyEvent.isKeyPressed(LogicalKeyboardKey.digit4) ||
            keyEvent.isKeyPressed(LogicalKeyboardKey.numpad4))
          digit4.onPressed();
        else if (keyEvent.isKeyPressed(LogicalKeyboardKey.digit5) ||
            keyEvent.isKeyPressed(LogicalKeyboardKey.numpad5))
          digit5.onPressed();
        else if (keyEvent.isKeyPressed(LogicalKeyboardKey.digit6) ||
            keyEvent.isKeyPressed(LogicalKeyboardKey.numpad6))
          digit6.onPressed();
        else if (keyEvent.isKeyPressed(LogicalKeyboardKey.digit7) ||
            keyEvent.isKeyPressed(LogicalKeyboardKey.numpad7))
          digit7.onPressed();
        else if (keyEvent.isKeyPressed(LogicalKeyboardKey.digit8) ||
            keyEvent.isKeyPressed(LogicalKeyboardKey.numpad8))
          digit8.onPressed();
        else if (keyEvent.isKeyPressed(LogicalKeyboardKey.digit9) ||
            keyEvent.isKeyPressed(LogicalKeyboardKey.numpad9))
          digit9.onPressed();
        else if (keyEvent.isKeyPressed(LogicalKeyboardKey.numpadDecimal) ||
            keyEvent.isKeyPressed(LogicalKeyboardKey.period))
          decimal.onPressed();
        else if (keyEvent.isKeyPressed(LogicalKeyboardKey.numpadAdd))
          operatorAdd.onPressed();
        else if (keyEvent.isKeyPressed(LogicalKeyboardKey.numpadSubtract) ||
            keyEvent.isKeyPressed(LogicalKeyboardKey.minus))
          operatorSub.onPressed();
        else if (keyEvent.isKeyPressed(LogicalKeyboardKey.numpadMultiply))
          operatorMul.onPressed();
        else if (keyEvent.isKeyPressed(LogicalKeyboardKey.numpadDivide))
          operatorDiv.onPressed();
        else if (keyEvent.isKeyPressed(LogicalKeyboardKey.enter) ||
            keyEvent.isKeyPressed(LogicalKeyboardKey.numpadEnter))
          evaluate.onPressed();
        else if (keyEvent.isKeyPressed(LogicalKeyboardKey.backspace))
          backspace.onPressed();
        else if (keyEvent.isKeyPressed(LogicalKeyboardKey.delete))
          clear.onPressed();
      },
      child: Container(
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
          button1: digit9,
          button2: digit8,
          button3: digit7,
          button4: operatorAdd,
        ),
        _buildBasicCalculatorBlockButtonRow(
          button1: digit6,
          button2: digit5,
          button3: digit4,
          button4: operatorSub,
        ),
        _buildBasicCalculatorBlockButtonRow(
          button1: digit3,
          button2: digit2,
          button3: digit1,
          button4: operatorDiv,
        ),
        _buildBasicCalculatorBlockButtonRow(
          button1: decimal,
          button2: digit0,
          button3: evaluate,
          button4: operatorMul,
        ),
      ],
    );
  }

  Widget _buildScientificCalculatorButtonBlock() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        operatorSqrt,
        operatorFact,
        operatorLn,
        operatorExp,
      ],
    );
  }

  Widget _buildEditContentBlock() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[backspace, clear],
    );
  }
}
