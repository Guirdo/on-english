import 'package:flutter/material.dart';
import 'package:on_english/src/home_page.dart';
import 'package:on_english/src/routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'On English',
      initialRoute: '/',
      routes: getApplicationRoutes(),
      onGenerateRoute: (settings){
        return MaterialPageRoute(
          builder: (context) => HomePage()
        );
      },
    );
  }
}