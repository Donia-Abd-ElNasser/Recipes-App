



import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:recipes_app/core/routes.dart';



import 'widget/custom_form_text_field.dart';
import 'widget/custom_signing_button.dart';
import 'widget/show_snack_bar.dart';


class SignUpView extends StatefulWidget {
  const SignUpView({super.key});
  

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  String? email;

  String? password;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  // Image.asset(
                  //   'assets/scholar.png',
                  const SizedBox(height: 100,),
                   const Text(
                    "Create New Account \n"
                    ,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Sign up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomFormTextField(
                      onChange: (data) {
                        email = data;
                      },
                      text: 'Email'),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomFormTextField(
                    obscureText: true,
                      onChange: (data) {
                        password = data;
                      },
                      text: 'Password'),
                  const SizedBox(
                    height: 15,
                  ),
                  SigningButton(
                      onTap: () async {
                        print('ya mosahel');

                        if (formKey.currentState!.validate()) {
                          isLoading = true;
                          setState(() {});

                          try {
                            await UserAuth();
                       GoRouter.of(context).push(AppRoutes.kSignupView,extra: email);
                            ShowSnackBar(context, 'Success');
                            print('offffffffffffffffffff');
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              ShowSnackBar(context,
                                  ' password provided is too weak.');
                            } else if (e.code == 'email-already-in-use') {
                              ShowSnackBar(context,
                                  'account already exists for that email.');
                            }
                          } catch (e) {
                            ShowSnackBar(context, 'There was an error');
                          }
                        }
                        // else {

                        // }
                        isLoading = false;
                        setState(() {
                         
                        });
                      },
                      ButtonText: 'Sign up'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'already have an account? ',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Sign in',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
          ),
    );
  }

  Future<void> UserAuth() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }

  
}