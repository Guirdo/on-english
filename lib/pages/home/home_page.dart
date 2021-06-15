import 'package:flutter/material.dart';
import 'package:on_english/pages/home/navbar.dart';

class HomePage extends StatelessWidget {
  final String name;
  final String email;
  final String photo;

  HomePage({Key key,@required this.name,@required this.email,@required this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(name: name,email: email,photo: photo),
      appBar: AppBar(
        title: Text('On English Home'),
      ),
      body: _createMain()
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
    final lessons = ['Say hello','Adjetives posessives','Farewell'];

    lessons.forEach((lesson) { 
      items..add(_cardTipo2())
            ..add(Divider());

    });

    return items;
  }

  Widget _cardTipo2() {
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
          Text('Say hello'),
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
