import 'package:calculathor/home.dart';
import 'package:calculathor/services/color_scheme.dart';
import 'package:calculathor/services/logging_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(CalculaThorApp());

class CalculaThorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<LoggingService>(
      create: (context) => LoggingService(),
      child: MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'DotGothic16',
          canvasColor: canvasColor,
        ),
        themeMode: ThemeMode.dark,
        home: Home(),
      ),
    );
  }
}
