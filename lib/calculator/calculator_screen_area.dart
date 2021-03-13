import 'package:calculathor/services/button_type.dart';
import 'package:calculathor/services/color_scheme.dart';
import 'package:calculathor/services/calculator_stream.dart';
import 'package:calculathor/services/logging_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculatorScreenArea extends StatefulWidget {
  @override
  _CalculatorScreenAreaState createState() => _CalculatorScreenAreaState();
}

class _CalculatorScreenAreaState extends State<CalculatorScreenArea> {
  String variableX = '';
  String variableY;
  String answer;
  Function computationFunction;
  ButtonType computationType;
  String operatorSymbol;
  String operatorDescription;

  void log() {
    Provider.of<LoggingService>(context)
        .log(operatorDescription, variableX, variableY, answer);
  }

  void _operator(AsyncSnapshot<dynamic> snapshot) {
    if (answer == null) {
      computationFunction = snapshot.data['data'];
      computationType = snapshot.data['dataType'];
      operatorSymbol = snapshot.data['operatorSymbol'];
      operatorDescription = snapshot.data['operatorDescription'];
      if (computationType == ButtonType.opUnary && variableY != null)
        variableY = null;
    }
  }

  void _operand(String streamData) {
    if (answer == null) {
      if (computationFunction == null) {
        if (streamData != '.' ||
            (streamData == '.' && !variableX.contains('.')))
          variableX += streamData;
      } else {
        if (variableX == ' ' || variableX.length == 0) {
          if (streamData != '.' ||
              (streamData == '.' && !variableX.contains('.')))
            variableX += streamData;
        } else if (computationType == ButtonType.opBinary) {
          if (streamData != '.' ||
              (streamData == '.' && !variableY.contains('.')))
            variableY = variableY == null ? streamData : variableY + streamData;
        } else if (computationType == ButtonType.opUnary) {
          if (streamData != '.' ||
              (streamData == '.' && !variableX.contains('.')))
            variableX += streamData;
        }
      }
    }
  }

  void evaluate() {
    if (computationType == ButtonType.opUnary && variableX != '') {
      answer = computationFunction(variableX).toString();
      log();
    } else if (computationType == ButtonType.opBinary &&
        variableY != null &&
        variableY != '') {
      answer = computationFunction(variableX, variableY).toString();
      log();
    }
  }

  void _backspace() {
    if (computationFunction != null) {
      if (variableY != null && variableY.length != 0) {
        variableY = variableY.substring(0, variableY.length - 1);
      } else if (variableY == null && variableX.length != 0) {
        variableX = variableX.substring(0, variableX.length - 1);
      }
    } else {
      if (variableX.length != 0) {
        variableX = variableX.substring(0, variableX.length - 1);
      }
    }
  }

  void _clearScreen() {
    variableX = '';
    variableY = null;
    computationFunction = null;
    computationType = null;
    answer = null;
    operatorSymbol = null;
  }

  Widget _buildCalculatorScreenUI() {
    const TextStyle textStyle = TextStyle(
      fontSize: 24.0,
      letterSpacing: 2.0,
    );

    Widget variableXText = Text(
      variableX,
      style: textStyle,
      textAlign: TextAlign.right,
    );
    Widget variableYText;
    if (variableY != null)
      variableYText = Text(
        variableY,
        style: textStyle,
        textAlign: TextAlign.right,
      );
    Widget answerText;
    if (answer != null)
      answerText = Text(
        answer,
        style: textStyle,
        textAlign: TextAlign.right,
      );
    Widget operatorText;
    if (operatorSymbol != null)
      operatorText = Text(operatorSymbol, style: textStyle);
    Widget equateSymbolText = Text('=', style: textStyle);

    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              if (operatorText != null && variableYText == null) operatorText,
              Expanded(child: variableXText),
            ],
          ), // VariableX
          if (variableYText != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[operatorText, variableYText],
            ),
          if (answerText != null) // VariableY
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[equateSymbolText, answerText],
            ), // Answer
        ],
      ),
    );
  }

  Widget _buildCalculatorScreen(
      BuildContext context, AsyncSnapshot<dynamic> snapshot) {
    if (!snapshot.hasData) {
      return _buildCalculatorScreenUI();
    } else {
      switch (snapshot.data['dataType']) {
        case ButtonType.opBinary:
        case ButtonType.opUnary:
          _operator(snapshot);
          break;

        case ButtonType.operand:
          _operand(snapshot.data['data']);
          break;
        case ButtonType.opEvaluate:
          evaluate();
          break;
        case ButtonType.backspace:
          _backspace();
          break;
        case ButtonType.clear:
          _clearScreen();
          break;
      }

      return _buildCalculatorScreenUI();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.0),
      height: 200.0,
      color: calculatorBackgroundColor,
      padding: EdgeInsets.all(16.0),
      alignment: Alignment.bottomRight,
      child: StreamBuilder(
        stream: CalculatorStream.streamController.stream,
        builder: _buildCalculatorScreen,
      ),
      // child: Text(calculatorText),
    );
  }
}
