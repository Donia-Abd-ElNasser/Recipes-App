import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes_app/core/routes.dart';

import 'sliding_text_widget.dart';


class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    super.initState();
    animatedMethod();
   navigateToNext();
  }
  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/splash_image.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SlidingTextWidget(slidingAnimation: slidingAnimation),
      ],
    );
  }
   void animatedMethod() {
     animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    slidingAnimation = Tween<Offset>(
      begin: Offset(0, 6),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();
  }
   void navigateToNext() {
    Future.delayed(const Duration(seconds: 4), () {
      GoRouter.of(context).push(AppRoutes.kOnboardingView);
    });
  }
}
