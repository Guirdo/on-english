import 'package:flutter/material.dart';

class CompleteSentencePage extends StatefulWidget {
  @override
  _CompleteSentencePageState createState() => _CompleteSentencePageState();
}

class _CompleteSentencePageState extends State<CompleteSentencePage> {
  String _blank = "_______";
  String _sentence = "";

  @override
  Widget build(BuildContext context) {
    setState(() {
      _sentence = "My name is $_blank Pedro Gutierrez";
    });
    return Scaffold(
        appBar: AppBar(
          title: Text('Complete the sentence'),
        ),
        body: Container(
          padding: EdgeInsets.all(50.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                _sentence,
                style: TextStyle(fontSize: 30.0),
                softWrap: true,
              ),
              TextButton(
                onPressed: () {},
                child: Text('is'),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  elevation: 5.0,
                  primary: Colors.white,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text('are'),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  elevation: 5.0,
                  primary: Colors.white,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text('you'),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  elevation: 5.0,
                  primary: Colors.white,
                ),
              ),
            ],
          ),
        ));
  }
}
