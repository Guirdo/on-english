import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:on_english/utils/user_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;
  
  AuthenticationBloc({@required UserRepository userRepository}) 
    : assert(userRepository != null),
    _userRepository = userRepository,
    super(Uninitialized());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if(event is AppStarted){
      yield* _mapAppStartedToState();
    }
    if(event is LoggedIn){
      yield* _mapLoggedInToState();
    }
    if(event is LoggedOut){
      yield* _mapLoggedOutToState();
    }
  }

  Stream<AuthenticationState> _mapAppStartedToState() async* {
    try{
      final isSignedIn = await _userRepository.isSignedIn();

      if(isSignedIn){
        final user = await _userRepository.getUser();
        yield Authenticated(user);
      }else{
        yield Unauthenticated();
      }
    }catch (_){
      yield Unauthenticated();
    }
  }

  Stream<AuthenticationState> _mapLoggedInToState() async* {
    yield Authenticated(
      await _userRepository.getUser()
    );
  }

  Stream<AuthenticationState> _mapLoggedOutToState() async* {
    yield Unauthenticated();
    _userRepository.signOut();
  }
}
