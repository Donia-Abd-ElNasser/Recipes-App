import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes_app/core/utils/constants.dart';
import 'package:recipes_app/core/utils/routes.dart';
import 'package:recipes_app/views/signin_view/view/widget/snack_bar.dart';
import 'package:recipes_app/views/signin_view/view_model/signin_cubit/signin_cubit.dart';
import 'package:recipes_app/views/signup_view/view/widget/custom_form_text_field.dart';

class SignInViewBody extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccessState) {
          ShowSnackBar(context, 'Success');
          Future.delayed(const Duration(seconds: 1), () {
            GoRouter.of(context).pushReplacement(
              AppRoutes.kHomeView,
              extra: nameController.text.trim(),
            );
          });
        } else if (state is SigninFailureState) {
          ShowSnackBar(context, state.errmessage);
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Stack(
            children: [
              Positioned(
                top: 5,
                left: -10,
                child: IconButton(
                  onPressed: () {
                    GoRouter.of(context).push(AppRoutes.kOnboardingView);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
              ),
              ListView(
                children: [
                  const SizedBox(height: 220),
                  Form(
                    key: formKey,
                    child: Center(
                      child: Column(
                        children: [
                          CustomFormTextField(
                            text: 'Name',
                            controller: nameController,
                          ),
                          const SizedBox(height: 16),
                          CustomFormTextField(
                            text: 'Email',
                            controller: emailController,
                          ),
                          const SizedBox(height: 16),
                          CustomFormTextField(
                            text: 'Password',
                            controller: passwordController,
                            obscureText: true,
                          ),
                          const SizedBox(height: 32),
                          SizedBox(
                            width: double.infinity,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                shape: const StadiumBorder(),
                                backgroundColor: kButtonColor,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 14),
                              ),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  BlocProvider.of<SigninCubit>(context)
                                      .userLogin(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim(),
                                  );
                                }
                              },
                              child: const Text(
                                'Login',
                                style:
                                    TextStyle(fontSize: 20, color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
