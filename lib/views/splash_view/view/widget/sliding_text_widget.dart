import 'package:flutter/material.dart';
import 'package:recipes_app/core/utils/constants.dart';


class SlidingTextWidget extends StatelessWidget {
  const SlidingTextWidget({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 100,
      left: 45,
      child: AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slidingAnimation,
            child: Text(
              'Craving something tasty?\nLet''s find the perfect recipe😋',
              style: TextStyle(
                color:  const Color.fromARGB(255, 92, 28, 4),
                fontWeight: FontWeight.w900,
                fontSize: 22,
                fontFamily: kGtsectrafont
              ),
            ),
          );
        },
      ),
    );
  }
}
