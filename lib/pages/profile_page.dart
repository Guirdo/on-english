import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final User user;
  ProfilePage({Key key,@required this.user}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState(user: user);
}

class _ProfilePageState extends State<ProfilePage> {
  final User user;
  Map<String, dynamic> _genres;
  String imgURL = "";
  bool _flag = false;

  _ProfilePageState({this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("Profile"),
       ),
       body: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column(
           children: <Widget>[
             CircleAvatar(
                backgroundImage: NetworkImage(user.photoURL),
                radius: 50.0,
              ),
              SizedBox(height: 10.0,),
              Text(
                user.displayName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0
                ),
              ),
              SizedBox(height: 10.0,),
              Text(user.email),
              Divider(thickness: 3.0,),

              FutureBuilder(
                builder: (context,snapshot){
                  _getGenres(user.uid);
                  return Container(height: 300,child: _createMusicList(context),);
                },

              ),

              SizedBox(height: 10.0,),

              ElevatedButton.icon(
                onPressed: (){
                  setState(() {
                    
                  });
                },
                icon: Icon(Icons.save), 
                label: Text("Save")
              )
           ],
         ),
       ),
    );
  }

  Future<void> _getGenres(String uid) async{
    FirebaseFirestore.instance
          .collection('music_taste')
          .doc(user.uid)
          .get()
          .then((value) => setState((){
            _genres = value.data();
          }));
  }

  ListView _createMusicList(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, int index){
        return CheckboxListTile(
          title: Text(_genres.keys.elementAt(index)),
          value: _genres[_genres.keys.elementAt(index)], 
          onChanged: (valor){
            setState(() {
               _genres[_genres.keys.elementAt(index)] = valor;
            });
          },
        );
      },
    );
  }
}