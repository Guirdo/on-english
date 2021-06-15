import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String _nickname = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Register'),
        ),
        body: ListView(
          padding: EdgeInsets.all(15.0),
          children: [
            _createNickName(),
            Divider(height: 30.0,),
            Text(
              'Music taste',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(height: 350.0,child: _createMusicList(context)),
            Divider(),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
                elevation: 5.0,
                primary: Colors.white,
              ),
              onPressed: (){}, 
              child: Text('Start the adventure')
            )
          ],
        ));
  }

  Widget _createNickName() {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          hintText: 'Nickname',
          icon: Icon(Icons.accessibility)),
    );
  }

  ListView _createMusicList(BuildContext context) {
    final genres = ['Country','Pop','Rock','Metal','Alternative','Indie','Rap','Electronic','Blues','Balad'];
    return ListView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: genres.length,
      itemBuilder: (context, int index){
        return CheckboxListTile(
          title: Text(genres[index]),
          value: false, 
          onChanged: (valor){},
        );
      },
    );
  }
}
