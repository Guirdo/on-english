import 'package:flutter/material.dart';

class FlashcardsPage extends StatefulWidget {
  @override
  createState() {
    return _FlashcardsPage();
  }
}

class _FlashcardsPage extends State<FlashcardsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('FLASHCARDS'),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Image(
              image: NetworkImage(
                  'https://cdn.mos.cms.futurecdn.net/LTgdH3aE3sitD5Hwvf7Nym-1200-80.jpg'),
              fit: BoxFit.fill,
            ),
            Text('\nPlatypus')
          ],
        ));
    //floatingActionButton: _ver());
  }

  /*Widget _ver() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SizedBox(width: 30.0),
        FloatingActionButton(
            child: Icon(Icons.exposure_zero), onPressed: _verCambio()),
      ],
    );
    }
    
    void _verCambio() {
                
  }*/

}
