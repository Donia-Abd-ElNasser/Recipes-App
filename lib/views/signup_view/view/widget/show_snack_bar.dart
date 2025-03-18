import 'package:flutter/material.dart';

void ShowSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text)),
    );
  }
const  appColor= Color(0xff4A1D18);