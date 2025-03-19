import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {
  CustomFormTextField(
      {super.key, this.obscureText = false, this.onChange, required this.text, required this.controller});
  Function(String)? onChange;
  final String text;
  final bool? obscureText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      controller: controller,
      obscureText: obscureText!,
      validator: (data) {
        if (data!.isEmpty) {
          return '$text is required';
        }
      },
      onChanged: onChange,
       decoration: InputDecoration(
        errorStyle:TextStyle(color: Colors.orange) ,
       labelStyle: TextStyle(color: Colors.orange),
                      labelText: text,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange),
                         borderRadius: BorderRadius.circular(25.0),
                      ) ,
                       focusedBorder:OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange),
                         borderRadius: BorderRadius.circular(25.0),
                      ) ,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
    ),
    );
  }
}