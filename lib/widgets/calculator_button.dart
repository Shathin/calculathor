import 'package:calculathor/services/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CalculatorButton extends StatelessWidget {
  // final String buttonText;
  final Widget child;
  final Function onPressed;
  final Color btnColor;
  final String tooltipText;

  CalculatorButton({
    // @required this.buttonText,
    @required this.child,
    @required this.onPressed,
    @required this.btnColor,
    @required this.tooltipText,
  })  : assert(child != null),
        assert(onPressed != null),
        assert(btnColor != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Tooltip(
        message: this.tooltipText,
        textStyle: TextStyle(fontSize: 18.0, color: canvasColor),
        waitDuration: Duration(seconds: 1),
        child: ElevatedButton(
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(shape: BoxShape.circle),
            height: 64.0,
            width: 64.0,
            child: child,
          ),
          onPressed: this.onPressed,
          style: ElevatedButton.styleFrom(
            primary: this.btnColor,
            elevation: 0.0,
            enabledMouseCursor: SystemMouseCursors.click,
            shape: CircleBorder(),
          ),
        ),
      ),
    );
  }
}
