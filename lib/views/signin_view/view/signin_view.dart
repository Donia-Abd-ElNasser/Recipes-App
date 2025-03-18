import 'package:flutter/material.dart';

import 'widget/signin_view_body.dart' show SignInViewBody;

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SignInViewBody(),
    );
  }
}