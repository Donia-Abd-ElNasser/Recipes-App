// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:recipes_app/core/utils/constants.dart';

class CustomSignInButton extends StatelessWidget {
  const CustomSignInButton({
    Key? key,
    required this.text, required this.bottomPosition,required this.onTap
  });
final String text;final double bottomPosition;
final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return  Positioned(
            bottom: bottomPosition,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,height: 50,
                  decoration: BoxDecoration(
                 color: kButtonColor,
                 // padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                            
                    borderRadius: BorderRadius.circular(30),
                  ),
                            
                child:  Center(
                  child: Text(
                    text,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                            ),
              ),
                        ),);
  }
}
