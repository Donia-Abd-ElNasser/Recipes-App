import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:recipes_app/core/shared_preference.dart';



part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  Future<void> registerUser({
    required String email,
    required String password,
  }) async {
    emit(SignupLoadingState());

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
if (userCredential.user != null) {
      emit(SignupSuccessState(succmsg: 'You have been Registered Successfully'));
    } else {
      emit(SignupFailureState(errmessage: 'Unexpected error, please try again.'));
    }
      // if (userCredential.user != null) {
      //   String? token = await userCredential.user?.getIdToken();

      //   if (token != null) {
      //     await CacheHelper.saveData(key: 'token', value: token);
        // }
       // emit(SignupSuccessState(succmsg: 'You have been Registered Successfully'));
      // } else {
      //   emit(SignupFailureState(errmessage: 'Unexpected error, please try again.'));
      // }
    } on FirebaseAuthException catch (e) {
      debugPrint('FirebaseAuthException: ${e.code}');

      if (e.code == 'weak-password') {
        emit(SignupFailureState(errmessage: 'The password is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(SignupFailureState(errmessage: 'This email is already in use.'));
      } else if (e.code == 'invalid-email') {
        emit(SignupFailureState(errmessage: 'The email address is badly formatted.'));
      } else if (e.code == 'network-request-failed') {
        emit(SignupFailureState(errmessage: 'No internet connection.'));
      } else {
        emit(SignupFailureState(errmessage: 'Signup failed: ${e.message}'));
      }
    } catch (e) {
      debugPrint('Unexpected error: $e');
      emit(SignupFailureState(errmessage: 'An unexpected error occurred.'));
    }
  }
}