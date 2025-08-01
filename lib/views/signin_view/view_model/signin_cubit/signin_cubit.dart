import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit() : super(SigninInitial());

  Future<void> userLogin({
    required String email,
    required String password,
  }) async {
    emit(SigninLoadingState());

    try {
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
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
      case 'wrong-password':
        return 'Incorrect password. Please try again.';
      case 'network-request-failed':
        return 'No internet connection.';
      default:
        return 'Login failed. Please try again.';
    }
  }
}
