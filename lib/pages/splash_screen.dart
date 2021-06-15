import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Splah screen"),),
      backgroundColor: Colors.indigo,
      body: Center(
        child: Text(
          "SPLASH SCREEN"
        ),
      ),
    );
  }
}