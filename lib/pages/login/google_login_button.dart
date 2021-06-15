import 'package:flutter/material.dart';
import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_english/bloc/login/login_bloc.dart';

class GoogleLoginButton extends StatelessWidget {
  
  
  GoogleLoginButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GoogleAuthButton(
      onPressed: (){
        ScaffoldMessenger.of(context)
        ..showSnackBar(
          SnackBar(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Logged in...'),
                CircularProgressIndicator()
              ],
            )
          )
        );

        BlocProvider.of<LoginBloc>(context).add(
          LogInWithGooglePressed()
        );
      }
    );
  }
}