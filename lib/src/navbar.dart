import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Guirdo'),
            accountEmail: Text('guirdo@email.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                  child: Image.network(
                      'https://avatars.githubusercontent.com/u/21044700?v=4',
                      width: 90.0,
                      height: 90.0,
                      fit: BoxFit.cover)),
            ),
            decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  image: NetworkImage(
                      'https://scontent.fcvj1-1.fna.fbcdn.net/v/t1.6435-9/148843787_3659996474078026_4778017136154797220_n.jpg?_nc_cat=106&ccb=1-3&_nc_sid=e3f864&_nc_ohc=XL_eSJZwFy0AX--KKyy&_nc_ht=scontent.fcvj1-1.fna&oh=be06b8b84067b1fee884f5dfbbc6f206&oe=60C86867'),
                  fit: BoxFit.cover,
                )),
          ),
          ListTile(
            leading: Icon(Icons.bar_chart),
            title: Text('Record'),
            onTap: () {
              Navigator.pushNamed(context, 'record');
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
              Navigator.pushNamed(context, 'log_out');
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
