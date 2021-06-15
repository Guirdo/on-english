import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_english/bloc/authentication/authentication_bloc.dart';
import 'package:on_english/pages/home/home_page.dart';
import 'package:on_english/pages/login/login_page.dart';
import 'package:on_english/pages/splash_screen.dart';
import 'package:on_english/utils/user_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final UserRepository userRepository = UserRepository();

  runApp(BlocProvider(
    create: (context) =>
        AuthenticationBloc(userRepository: userRepository)..add(AppStarted()),
    child: App(
      userRepository: userRepository,
    ),
  ));
}

class App extends StatelessWidget {
  final UserRepository _userRepository;

  App({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is Uninitialized) {
            return SplashScreen();
          }
          if (state is Authenticated) {
            return HomePage(
              name: state.displayName,
              email: state.email,
              photo: state.photoURL,
            );
          }
          if(state is Unauthenticated){
            return LoginPage(userRepository: _userRepository,);
          }
          return Container();
        },
      ),
    );
  }
}
