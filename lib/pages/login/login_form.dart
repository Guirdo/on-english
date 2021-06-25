import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_english/bloc/authentication/authentication_bloc.dart';
import 'package:on_english/bloc/login/login_bloc.dart';
import 'package:on_english/pages/login/google_login_button.dart';
import 'package:on_english/pages/login/login_button.dart';
import 'package:on_english/utils/user_repository.dart';

class LoginForm extends StatefulWidget {
  final UserRepository _userRepository;

  LoginForm({Key key,@required UserRepository userRepository}) 
    : assert(userRepository != null),
      _userRepository = userRepository,
      super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginBloc _loginBloc;

  UserRepository get _userRepository => widget._userRepository;

  bool get isPopulated =>
    _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool isLogButtonEnabled(LoginState state){
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context,state){
        if(state.isFailure){
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Login failure'),Icon(Icons.error)],
                ),
                backgroundColor: Colors.red,
              ),
            );
        }
        if(state.isSubmitting){
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Logging in...'),
                    CircularProgressIndicator()
                  ],
                ),
                backgroundColor: Colors.red,
              ),
            );
        }
        if(state.isSuccess){
          BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
        }
      },
      child: BlocBuilder<LoginBloc,LoginState>(
        builder: (context,state){
          return Padding(
            padding: EdgeInsets.all(30.0),
            child: Form(
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Icon(Icons.person,size: 200.0,),
                  ),
                  /*
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.email),
                      labelText: 'Email'
                    ),
                    keyboardType: TextInputType.emailAddress,
                    autovalidateMode: AutovalidateMode.always,
                    autocorrect: false,
                    validator: (_){
                      return !state.isEmailValid? 'Invalid email' : null; 
                    }
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      labelText: 'Password'
                    ),
                    obscureText: true,
                    autovalidateMode: AutovalidateMode.always,
                    autocorrect: false,
                    validator: (_){
                      return !state.isPasswordValid? 'Invalid password' : null; 
                    }
                  ),
                  */
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        /*
                        LoginButton(
                          onPressed: isLogButtonEnabled(state)
                            ?_onFormSubmitted : null,
                        ),*/
                        GoogleLoginButton()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onEmailChanged(){
    _loginBloc.add(
      EmailChanged(email: _emailController.text)
    );
  }

  void _onPasswordChanged(){
    _loginBloc.add(
      PasswordChanged(password: _passwordController.text)
    );
  }

  void _onFormSubmitted(){
    _loginBloc.add(
      LogInWithCredentialsPressed(
        email: _emailController.text,
        password: _passwordController.text
      )
    );
  }
}