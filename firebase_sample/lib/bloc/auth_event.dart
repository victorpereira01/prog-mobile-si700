import 'package:firebase_sample/models/user_model.dart';

abstract class AuthEvent {}

class RegisterUser extends AuthEvent {
  String username;
  String password;
}

class LoginUser extends AuthEvent {
  String username;
  String password;
}

class LoginAnonimousUser extends AuthEvent {}

class Logout extends AuthEvent {}

class InnerServerEvent extends AuthEvent {
  final UserModel userModel;

  InnerServerEvent(this.userModel);
}
