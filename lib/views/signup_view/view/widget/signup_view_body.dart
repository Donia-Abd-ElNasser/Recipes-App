import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:recipes_app/core/constants.dart';
import 'package:recipes_app/core/routes.dart';

import 'package:recipes_app/views/signup_view/view/widget/custom_form_text_field.dart';
import 'package:recipes_app/views/signup_view/view/widget/custom_signing_button.dart';

import 'package:recipes_app/views/signup_view/view_model/signup_cubit/signup_cubit.dart';

class SignupViewBody extends StatelessWidget {
  SignupViewBody({super.key});
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey();

  // bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccessState) {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.bottomSlide,
            title: 'Success',
            desc: state.succmsg,
            btnOkOnPress: () {
              GoRouter.of(context).pushReplacement(AppRoutes.kSigninView,extra: nameController.text);
            },
          ).show();
        } else if (state is SignupFailureState) {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            headerAnimationLoop: false,
            title: 'Error',
            desc: state.errmessage,
            btnOkOnPress: () {},
            btnOkIcon: Icons.cancel,
            btnOkColor: Colors.red,
          ).show();
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const SizedBox(height: 120),
                Center(
                  child: const Text(
                    "Get Started With Us",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      fontFamily: kGtsectrafont,
                    ),
                  ),
                ),
                Center(
                  child: const Text(
                    'Welcome ,please enter your details',
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ),
                const SizedBox(height: 70),
                //CustomFormTextField(controller: nameController, text: 'Name'),
                SizedBox(height: 15),
                CustomFormTextField(controller: emailController, text: 'Email'),
                SizedBox(height: 15),
                CustomFormTextField(
                  controller: passwordController,
                  obscureText: true,
                  text: 'Password',
                ),
                SizedBox(height: 50),

                SigningButton(
                  ButtonText: 'Sign Up',
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<SignupCubit>(context).registerUser(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
