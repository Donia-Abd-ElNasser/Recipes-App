import 'package:flutter/material.dart';
import 'package:recipes_app/core/constants.dart';


class SlidingTextWidget extends StatelessWidget {
  const SlidingTextWidget({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 180,
      left: 60,
      child: AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slidingAnimation,
            child: Text(
              'Delicious recipes, one tap away!',
              style: TextStyle(
                color:  Colors.orange,
                fontWeight: FontWeight.w800,
                fontSize: 20,
                fontFamily: kGtsectrafont
              ),
            ),
          );
        },
      ),
    );
  }
}
