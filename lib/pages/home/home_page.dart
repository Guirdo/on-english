import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:on_english/pages/home/navbar.dart';

class HomePage extends StatelessWidget {
  final User user;

  HomePage({Key key,@required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(user: user),
      appBar: AppBar(
        title: Text('On English Home'),
      ),
      body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                "Unit 1",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold
                )
              ),
              ),
              Container(height: 150,child: _createMain())
            ],
          ),
        ),
    );
  }

  Widget _createMain() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: _createListItem(),
    );
  }

  List<Widget> _createListItem(){
    final List<Widget> items = [];
    final lessons = ['Say hello','Posessives adjetives','Farewell'];

    lessons.forEach((lesson) { 
      items..add(_cardTipo2(lesson))
            ..add(Divider());

    });

    return items;
  }

  Widget _cardTipo2(String lesson) {
    final card = Container(
      child: Column(
        children: [
          Image(
            image: NetworkImage(
                'https://icons.iconarchive.com/icons/dtafalonso/modern-xp/512/ModernXP-73-Globe-icon.png'),
            //fadeInDuration: Duration(milliseconds: 200),
            height: 70.0,
            fit: BoxFit.cover,
          ),
          Text(lesson),
        ],
      ),
    );

    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(20.0),
        child: ClipRRect(
          child: card,
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      onTap: (){
        print("Hola, soy $lesson");
      },
    );
  }
}
