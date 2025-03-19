import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
  Future<void> registerUser({
    required String email,
    required String password,
  }) async {
    emit(SignupLoadingState());
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      emit(
        SignupSuccessState(succmsg: 'You have been Registered Successfully'),
      );
      print('tmam');
    } on FirebaseAuthException catch (e) {
      print(' fe moshkla');
      if (e.code == 'weak-password') {
        emit(SignupFailureState(errmessage: e.code));
        print('weak');
      } else if (e.code == 'email-already-in-use') {
        emit(SignupFailureState(errmessage: e.code));

        print('mawgood');
      } else if (e.code == 'The email address is badly formatted.') {
        emit(SignupFailureState(errmessage: e.code));
      }
    } catch (e) {
      emit(SignupFailureState(errmessage: e.toString()));
      print('error');
    }
  }
}
