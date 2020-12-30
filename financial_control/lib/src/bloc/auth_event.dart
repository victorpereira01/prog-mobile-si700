import 'package:financial_control/src/models/user_model.dart';

abstract class AuthEvent {}

class RegisterUser extends AuthEvent {
  String email;
  String password;
}

class LoginUser extends AuthEvent {
  String email;
  String password;
}

class LoginAnonimousUser extends AuthEvent {}

class Logout extends AuthEvent {}

class LoginWithGoogle extends AuthEvent {}

class LogoutGoogle extends AuthEvent {}

class InnerServerEvent extends AuthEvent {
  final UserModel userModel;

  InnerServerEvent(this.userModel);
}
