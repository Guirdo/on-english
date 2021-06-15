part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
  
  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class Uninitialized extends AuthenticationState {
  @override
  String toString() => "No inicializado";
}

class Authenticated extends AuthenticationState {
  final String displayName;
  final String email;
  final String photoURL;

  const Authenticated(this.displayName,this.email,this.photoURL);

  @override
  List<Object> get props => [displayName,email,photoURL];

  @override
  String toString() => "Autenticado - displayName : $displayName";
}

class Unauthenticated extends AuthenticationState {
  @override
  String toString() => "No autenticado";
}
