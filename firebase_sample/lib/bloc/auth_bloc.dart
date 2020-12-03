import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_sample/bloc/auth_event.dart';
import 'package:firebase_sample/bloc/auth_state.dart';
import 'package:firebase_sample/firebase/auth.dart';
import 'package:firebase_sample/models/user_model.dart';
import 'package:firebase_sample/repositories/auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepository _authService;
  StreamSubscription _authStream;

  AuthBloc() : super(Unauthenticated()) {
    _authService = FirebaseAuthenticationService();
    _authStream = _authService.user.listen((UserModel event) {
      add(InnerServerEvent(event));
    });
  }

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    try {
      if (event == null) {
        yield Unauthenticated();
      } else if (event is RegisterUser) {
        UserModel userModel = await _authService.createUserWithEmailAndPassword(
            email: event.username, password: event.password);
        yield Authenticated(userModel);
      } else if (event is LoginAnonimousUser) {
        await _authService.signInAnonimo();
      } else if (event is LoginUser) {
        await _authService.signInWithEmailAndPassword(
            email: event.username, password: event.password);
      } else if (event is Logout) {
        await _authService.signOut();
      } else if (event is InnerServerEvent) {
        if (event.userModel == null) {
          yield Unauthenticated();
        } else {
          yield Authenticated(event.userModel);
        }
      }
    } catch (e) {
      yield AuthError(e.toString());
    }
  }

  @override
  Future<void> close() {
    _authStream.cancel();
    return super.close();
  }
}
