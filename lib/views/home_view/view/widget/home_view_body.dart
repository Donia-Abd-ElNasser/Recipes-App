import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
     final name = GoRouterState.of(context).extra as String? ;
     print("Name recieved navigation: $name");
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: Text('Hi,{$name ?? "Guest"}',style: TextStyle(fontSize: 30),),
          )
        ],
      ),
    );
  }
}