import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes_app/core/routes.dart';

import 'custom_signin_button.dart';


class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/signin_page.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        CustomSignInButton(
          text: 'Sign in',
          bottomPosition: 120,
          onTap: () => GoRouter.of(context).push(AppRoutes.kSigninView),
        ),
        CustomSignInButton(
          text: 'Sign up',
          bottomPosition: 60,
          onTap: () => GoRouter.of(context).push(AppRoutes.kSignupView),
        ),
      ],
    );
  }
}
