import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_english/bloc/login/login_bloc.dart';
import 'package:on_english/utils/user_repository.dart';

import 'login_form.dart';

class LoginPage extends StatelessWidget {
  final UserRepository _userRepository;

  LoginPage({Key key,@required UserRepository userRepository})
    : assert(userRepository != null),
      _userRepository = userRepository,
      super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(userRepository: _userRepository),
        child: LoginForm(userRepository: _userRepository),
      )
    );
  }
}