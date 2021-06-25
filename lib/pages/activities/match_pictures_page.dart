import 'package:flutter/material.dart';

class MatchPicturesPage extends StatefulWidget {
  @override
  createState() {
    return _MatchPicturesPage();
  }
}

class _MatchPicturesPage extends State<MatchPicturesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MATCH PICTURES'),
        centerTitle: true,
      ),
    );
  }
}
