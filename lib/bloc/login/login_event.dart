part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends LoginEvent{
  final String email;

  const EmailChanged({@required this.email});

  @override
  List<Object> get props => [email];

  @override
  String toString() => 'EmailChanged {email: $email}';
} 

class PasswordChanged extends LoginEvent{
  final String password;

  const PasswordChanged({@required this.password});

  @override
  List<Object> get props => [password];

  @override
  String toString() => 'PasswordChanged {password: $password}';
}

class Submitted extends LoginEvent{
  final String email;
  final String password;

  const Submitted({@required this.email,@required this.password});

  @override
  List<Object> get props => [email,password];

  @override
  String toString() => 'Submitted {email: $email,password: $password}';
}

class LogInWithGooglePressed extends LoginEvent{}

class LogInWithCredentialsPressed extends LoginEvent{
  final String email;
  final String password;

  const LogInWithCredentialsPressed({
    @required this.email,@required this.password
  });

  @override
  List<Object> get props => [email,password];

  @override
  String toString() => 'LogInWithCredentials {email: $email,password: $password}';
}
