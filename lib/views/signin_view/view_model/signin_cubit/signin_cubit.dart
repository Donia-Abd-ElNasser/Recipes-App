import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:recipes_app/core/shared_preference.dart';


part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit() : super(SigninInitial());

  Future<void> UserLogin({
    required String email,
    required String password,
  }) async {
    emit(SigninLoadingState());

    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        // Get the token
        String? token = await userCredential.user?.getIdToken();

        if (token != null) {
          await CacheHelper.saveData(key: 'token', value: token);
        }

        emit(SigninSuccessState());
      } else {
        emit(SigninFailureState('Unexpected error, please try again.'));
      }

    } on FirebaseAuthException catch (e) {
      emit(SigninFailureState(_getFirebaseErrorMessage(e.code)));
    } catch (e) {
      emit(SigninFailureState('An unexpected error occurred.'));
    }
  }

  String _getFirebaseErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'user-not-found':
        return 'No user found with this email.';
      case 'invalid-credential':
        return 'Incorrect password. Please try again.';
      case 'network-request-failed':
        return 'No internet connection.';
      default:
        return 'Login failed. Please try again.';
    }
  }
}