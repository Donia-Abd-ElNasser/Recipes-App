// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../core/utils/constants.dart' show kGtsectrafont;

class Recipe extends StatelessWidget {
  const Recipe({
    Key? key,
    required this.recipe,
  }) : super(key: key);
final String recipe;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(8),
            ),
      child: Text(
                recipe,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: kGtsectrafont,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  // color: Colors.black
                ),
              ),
    );
  }
}
