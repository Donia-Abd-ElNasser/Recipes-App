part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupLoadingState extends SignupState {
  Center loading(){
     return Center(child: CircularProgressIndicator());
  }
}

final class SignupSuccessState extends SignupState {
   final String succmsg;

  SignupSuccessState({required this.succmsg});
}

final class SignupFailureState extends SignupState {
  final String errmessage;

  SignupFailureState({required this.errmessage});
}