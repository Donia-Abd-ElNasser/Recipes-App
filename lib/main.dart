import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/core/constants.dart';
import 'package:recipes_app/core/routes.dart';
import 'package:recipes_app/core/shared_preference.dart';
import 'package:recipes_app/firebase_options.dart';
import 'package:recipes_app/views/signin_view/view_model/signin_cubit/signin_cubit.dart';
import 'package:recipes_app/views/signup_view/view_model/signup_cubit/signup_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  //Check if token exists
  String? token = CacheHelper.getData(key: 'token');
  bool isLoggedIn = token != null;

  runApp(RecipesApp(isLoggedIn: isLoggedIn));
}

class RecipesApp extends StatelessWidget {
  final bool isLoggedIn;
 
  const RecipesApp({super.key,required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SignupCubit()),
        BlocProvider(create: (context) => SigninCubit()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRoutes.getRouter(isLoggedIn: isLoggedIn),
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: ThemeData.dark().textTheme.apply(
            fontFamily: 'kGtsectrafont',
          ),
        ),
      ),
    );
  }
}
