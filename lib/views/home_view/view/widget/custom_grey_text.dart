import 'package:flutter/material.dart';
import 'package:recipes_app/core/utils/constants.dart';

class CustomGreyText extends StatelessWidget {
  const CustomGreyText({
    super.key, required this.text,
  });
final String text;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.5,
      child: Text(text,style: TextStyle(fontSize: 18,fontFamily: kGtsectrafont)));
  }
}