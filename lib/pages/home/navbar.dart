import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_english/bloc/authentication/authentication_bloc.dart';
import 'package:on_english/pages/profile_page.dart';

import '../record_page.dart';

class NavBar extends StatelessWidget {
  final User user;

  NavBar({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(user.displayName),
            accountEmail: Text(user.email),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  user.photoURL,
                  width: 150.0, 
                  height: 150.0, 
                  fit: BoxFit.cover)
                ),
            ),
            decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  image: AssetImage('assets/landscape/sea.jpg'),
                  fit: BoxFit.cover,
                )),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage(user: user)),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.bar_chart),
            title: Text('Record'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RecordPage()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.group),
            title: Text('Mates'),
            onTap: () {
              Navigator.pushNamed(context, 'mates');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('Dictionary'),
            onTap: () {
              Navigator.pushNamed(context, 'dictionary');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.music_note),
            title: Text('The song of the week'),
            onTap: () {
              Navigator.pushNamed(context, 'song_week');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.help_center),
            title: Text('Help chat'),
            onTap: () {
              Navigator.pushNamed(context, 'help_chat');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.monetization_on),
            title: Text('Go Premium'),
            onTap: () {
              Navigator.pushNamed(context, 'go_premium');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.pushNamed(context, 'settings');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Log out'),
            onTap: () {
              BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
