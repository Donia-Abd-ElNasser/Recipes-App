import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: (){
            GoRouter.of(context).pop();
          }, icon: Icon(FontAwesomeIcons.chevronLeft)),
           IconButton( 
                              onPressed: (){}
                              , 
                              icon: Icon( 
                                FontAwesomeIcons.solidBookmark, 
                                color:  Colors.orange, 
                              ), 
                            ), 
        ],
      ),
    );
  }
}