import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recipes_app/core/utils/constants.dart';

import 'package:recipes_app/views/home_view/view/widget/custom_grey_text.dart';

class CustomOnBoardingWidget extends StatelessWidget {
  const CustomOnBoardingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kWidgetColor,
        borderRadius: BorderRadius.circular(20),
      ),
      width: MediaQuery.of(context).size.width,
      height: 180,

      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 15),
                CustomGreyText(text: 'Popular For Dinner'),
                SizedBox(height: 30),
                Text(
                  'Chicken Byrani',
                  style: TextStyle(fontSize: 24, fontFamily: kGtsectrafont),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(FontAwesomeIcons.clock, color: Colors.orange),
                    SizedBox(width: 15),
                    CustomGreyText(text: '30 Min'),
                    SizedBox(width: 15),
                    Icon(FontAwesomeIcons.fire, color: Colors.orange),
                    CustomGreyText(text: ' Easy lvl'),
                  ],
                ),
              ],
            ),
          ),
          //Image.asset('assets/chickenByrani 1.jpg',width: 50,height: 150,),
        ],
      ),
    );
  }
}
