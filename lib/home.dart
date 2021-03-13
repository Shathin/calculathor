import 'package:calculathor/calculator/calculator.dart';
import 'package:calculathor/services/color_scheme.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Widget _buildAppBarTitle() => Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'CalculaThor',
            style: TextStyle(
              letterSpacing: 3.0,
              fontSize: 24.0,
              color: defaultTextColor,
            ),
          ),
          SizedBox(
            width: 16.0,
          ),
          Image.asset(
            'images/thor_mjolnir.png',
            height: 48.0,
          ),
        ],
      );

  Widget _buildAppBar() => AppBar(
        centerTitle: true,
        title: _buildAppBarTitle(),
        elevation: 0.0,
        backgroundColor: canvasColor,
      );

  Widget _buildFooter() {
    const footerTextStyle = TextStyle(
      fontSize: 16.0,
      letterSpacing: 2.0,
    );

    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Made with ',
            style: footerTextStyle,
          ),
          Image.asset('images/8_bit_heart.png', height: 16.0),
          Text(
            ' by Shathin',
            style: footerTextStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Calculator(),
            ),
          ),
          _buildFooter(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
}
