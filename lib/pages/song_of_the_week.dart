import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SongPage extends StatefulWidget {
  @override
  createState() {
    return _SongPage();
  }
}

class _SongPage extends State<SongPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SONG OF THE WEEK'),
          centerTitle: true,
        ),
        body: Center(
          child: ElevatedButton(
              child: Text("DESCUBRE TU CANCIÓN DE LA SEMANA"),
              onPressed: () {
                launch("https://www.youtube.com/watch?v=m7iwY1oIwO8");
              }),
        ));
  }
}
