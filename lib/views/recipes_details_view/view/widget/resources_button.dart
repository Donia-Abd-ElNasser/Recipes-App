// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:recipes_app/core/constants.dart';

class ResourcesButton extends StatelessWidget {
   ResourcesButton({
    Key? key,
    required this.name,
    required this.onTap,
    required this.color,
    required this.icon,
  }) : super(key: key);
final String name;
final Color color;
final IconData icon;
 void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
    
        height: 50,width: 150,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          
          children: [
            Icon(icon,size: 22,),
            Text(
              name,style: TextStyle(
                fontSize: 20,
                  fontFamily: kGtsectrafont,
                  fontWeight: FontWeight.bold,
           
              ),
            ),
          ],
        ),
      ),
    );
  }
}
