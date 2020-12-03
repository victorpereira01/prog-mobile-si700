import 'package:firebase_sample/models/user_model.dart';

abstract class AuthRepository {
  Future<UserModel> signInAnonimo();

  Future<UserModel> signInWithEmailAndPassword({String email, String password});

  Future<UserModel> createUserWithEmailAndPassword(
      {String email, String password});

  Future<void> signOut();

  Stream<UserModel> get user;
}
