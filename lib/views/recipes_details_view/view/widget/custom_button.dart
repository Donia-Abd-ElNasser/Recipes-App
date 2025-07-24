import 'package:flutter/material.dart';
import 'package:recipes_app/core/utils/constants.dart';

class CustomButton extends StatelessWidget {
   CustomButton({super.key, required this.text,required this.onTap});
  final String text;
 void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: GestureDetector(
onTap: onTap,
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: kGtsectrafont,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  // color: Colors.black
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
