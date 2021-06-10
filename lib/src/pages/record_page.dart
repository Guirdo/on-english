import 'dart:math';

import 'package:flutter/material.dart';

class RecordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Global Record'),
      ),
      body: Column(
        children: [
          _cardTipo2(),
          Expanded(
            child: _createList(context),
          ),
        ],
      ),
    );
  }

  Widget _createList(BuildContext context) {
    final nombres = [
      'guirdo',
      'dianini',
      'Anne',
      'yolzz',
      'caldo',
      'athala',
      'adiel',
      'gaby',
      'tulio',
      'juanin'
    ];
    final random = new Random();

    return ListView.builder(
      itemCount: nombres.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(nombres[index]),
          leading: Icon(Icons.account_circle),
          trailing: Text(random.nextInt(300).toString()),
        );
      },
    );
  }

  Widget _cardTipo2() {
    final card = Container(
      child: Column(
        children: [
          Image(
            image: NetworkImage(
                'https://icons.iconarchive.com/icons/dtafalonso/modern-xp/512/ModernXP-73-Globe-icon.png'),
            height: 100.0,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );

    return Container(
      margin: EdgeInsets.all(20.0),
      child: ClipRRect(
        child: card,
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }
}
