// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:recipes_app/core/constants.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    Key? key,
  required this.categoryName,
  }) : super(key: key);
final String categoryName;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 100,height: 40,
        decoration: BoxDecoration(
          color:kWidgetColor,
          borderRadius: BorderRadius.circular(25),
          
        ),
        child: Center(child: Text(categoryName,style: TextStyle(fontSize: 16,fontFamily: kGtsectrafont))),
      ),
    );
  }
}
