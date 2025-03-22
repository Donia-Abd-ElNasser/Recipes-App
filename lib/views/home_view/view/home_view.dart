import 'package:flutter/material.dart';
import 'package:recipes_app/views/home_view/view/widget/navigation_bar.dart';


import 'widget/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeViewBody(),
      bottomNavigationBar: CategoryBar(),
    );
  }
}