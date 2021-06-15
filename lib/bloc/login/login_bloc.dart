import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:on_english/utils/user_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepository _userRepository;

  LoginBloc({@required UserRepository userRepository}) 
    : assert(userRepository != null),
      _userRepository = userRepository,
      super(LoginState.empty());

  @override
  Stream<Transition<LoginEvent, LoginState>> transformEvents(Stream<LoginEvent> events, TransitionFunction<LoginEvent, LoginState> transitionFn) {
    final nonDebounceStream = events.where((event){
      return (event is! EmailChanged && event is! PasswordChanged);
    });

    final debounceStream = events.where((event){
      return (event is EmailChanged && event is PasswordChanged);
    }).timeout(Duration(milliseconds: 300));

    return super.transformEvents(events, transitionFn);
  }

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if(event is EmailChanged){
      yield* _mapEmailChangedToState(event.email);
    }
    if(event is PasswordChanged){
      yield* _mapPasswordChangedToState(event.password);
    }
    if(event is LogInWithGooglePressed){
      yield* _mapLogInWithGooglePressedToState();
    }
    if(event is LogInWithCredentialsPressed){
      yield* _mapLogInWithCredentialsPressedToState();
    }
  }

  Stream<LoginState> _mapEmailChangedToState(String email) async*{
    yield state.update(
      isEmailValid: true,
    );
  }

  Stream<LoginState> _mapPasswordChangedToState(String password) async*{
    yield state.update(
      isPasswordValid: true,
    );
  }

  Stream<LoginState> _mapLogInWithGooglePressedToState()async*{
    try{
      await _userRepository.signInWithGoogle();
      yield LoginState.success();
    } catch(_){
      yield LoginState.failure();
    }
  }

  Stream<LoginState> _mapLogInWithCredentialsPressedToState({
    String email, String password
  }) async* {
    yield LoginState.loading();
    try{
      await _userRepository.signInWithCredentials(email, password);
      yield LoginState.success();
    }catch(_){
      yield LoginState.failure();
    }
  }
}
