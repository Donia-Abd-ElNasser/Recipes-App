import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/core/constants.dart';
import 'package:recipes_app/core/routes.dart';
import 'package:recipes_app/firebase_options.dart';
import 'package:recipes_app/views/signup_view/view_model/signup_cubit/signup_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  runApp(RecipesApp());
}

class RecipesApp extends StatelessWidget {
  const RecipesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
BlocProvider(create: (context)=>SignupCubit()),


      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRoutes.routers,
        theme:ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
        textTheme: TextTheme(
      bodyLarge: TextStyle(fontFamily: 'kGtsectrafont'),
      bodyMedium: TextStyle(fontFamily: 'kGtsectrafont'),
      bodySmall: TextStyle(fontFamily: 'kGtsectrafont'),
        ),
      ),
      ),
    );
  }
}
