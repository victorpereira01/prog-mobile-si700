import 'package:financial_control/src/models/user_model.dart';

abstract class AuthRepository {
  Future<UserModel> signInWithEmailAndPassword({String email, String password});

  Future<UserModel> createUserWithEmailAndPassword(
      {String email, String password});

  Future<void> signOut();

  Future<String> signInWithGoogle();

  Future<void> signOutGoogle();

  Stream<UserModel> get user;
}
