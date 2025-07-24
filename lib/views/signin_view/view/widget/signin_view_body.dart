import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes_app/core/utils/constants.dart';
import 'package:recipes_app/core/utils/routes.dart';
import 'package:recipes_app/views/signin_view/view/widget/animation_enum.dart';
import 'package:recipes_app/views/signin_view/view/widget/snack_bar.dart';
import 'package:recipes_app/views/signin_view/view_model/signin_cubit/signin_cubit.dart';

import 'package:rive/rive.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  Artboard? riveArtboard;
  late RiveAnimationController controllerIdle;
  late RiveAnimationController controllerHandsUp;
  late RiveAnimationController controllerHandsDown;
  late RiveAnimationController controllerLookLeft;
  late RiveAnimationController controllerLookRight;
  late RiveAnimationController controllerSuccess;
  late RiveAnimationController controllerFail;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = 'null';
  String name = 'null';
  String password = 'null';
  final passwordFocusNode = FocusNode();

  bool isLookingLeft = false;
  bool isLookingRight = false;

  void removeAllControllers() {
    riveArtboard?.artboard.removeController(controllerIdle);
    riveArtboard?.artboard.removeController(controllerHandsUp);
    riveArtboard?.artboard.removeController(controllerHandsDown);
    riveArtboard?.artboard.removeController(controllerLookLeft);
    riveArtboard?.artboard.removeController(controllerLookRight);
    riveArtboard?.artboard.removeController(controllerSuccess);
    riveArtboard?.artboard.removeController(controllerFail);
    isLookingLeft = false;
    isLookingRight = false;
  }

  void addSpecifcAnimationAction(
    RiveAnimationController<dynamic> neededAnimationAction,
  ) {
    removeAllControllers();
    riveArtboard?.artboard.addController(neededAnimationAction);
  }

  @override
  void dispose() {
    passwordFocusNode.removeListener;
    super.dispose();
  }

  void checkForPasswordFocusNodeToChangeAnimationState() {
    passwordFocusNode.addListener(() {
      if (passwordFocusNode.hasFocus) {
        addSpecifcAnimationAction(controllerHandsUp);
      } else if (!passwordFocusNode.hasFocus) {
        addSpecifcAnimationAction(controllerHandsDown);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    controllerIdle = SimpleAnimation(AnimationEnum.idle.name);
    controllerHandsUp = SimpleAnimation(AnimationEnum.eye_cover.name);
    controllerHandsDown = SimpleAnimation(AnimationEnum.idle_look_around.name);
    controllerLookRight = SimpleAnimation(AnimationEnum.look_right.name);
    controllerLookLeft = SimpleAnimation(AnimationEnum.look_left.name);
    controllerSuccess = SimpleAnimation(AnimationEnum.success.name);
    controllerFail = SimpleAnimation(AnimationEnum.fail.name);

    loadRiveFileWithItsStates();

    checkForPasswordFocusNodeToChangeAnimationState();
  }

  void loadRiveFileWithItsStates() {
    rootBundle.load('assets/animation/bunny_login.riv').then((data) {
      final file = RiveFile.import(data);
      final artboard = file.mainArtboard;
      artboard.addController(controllerIdle);
      setState(() {
        riveArtboard = artboard;
      });
    });
  }

  void validateEmailAndPassword() async {
    if (formKey.currentState!.validate()) {
      try {
        formKey.currentState!.save();
        await BlocProvider.of<SigninCubit>(
          context,
        ).UserLogin(email: email, password: password);

        BlocListener<SigninCubit, SigninState>(
          listener: (context, state) {
            if (state is SigninSuccessState) {
              addSpecifcAnimationAction(controllerSuccess);
              ShowSnackBar(context, 'Success');
              print("Name before navigation: $name");
              Future.delayed(const Duration(seconds: 3), () {
                GoRouter.of(
                  context,
                ).pushReplacement(AppRoutes.kHomeView, extra: name);
              });
            } else if (state is SigninFailureState) {
              addSpecifcAnimationAction(controllerFail);
              ShowSnackBar(context, state.errmessage);
            }
          },
        );
      } catch (e) {
        addSpecifcAnimationAction(controllerFail);
        ShowSnackBar(context, 'An error occurred.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccessState) {
          addSpecifcAnimationAction(controllerSuccess);
          ShowSnackBar(context, 'Success');
          Future.delayed(const Duration(seconds: 3), () {
            GoRouter.of(context).push(AppRoutes.kHomeView);
          });
        } else if (state is SigninFailureState) {
          addSpecifcAnimationAction(controllerFail);
          ShowSnackBar(context, state.errmessage);
        }
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16),
          child: ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                child:
                    riveArtboard == null
                        ? const SizedBox.shrink()
                        : Rive(artboard: riveArtboard!),
              ),
              SizedBox(height: 20),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Name",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kButtonColor),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kButtonColor),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      validator: (value) {
    if (value == null || value.isEmpty) {
      addSpecifcAnimationAction(controllerFail);
      return "Name is required.";
    }
    if (value.length <= 2) {
      addSpecifcAnimationAction(controllerFail);
      return "Name must be more than 2 characters.";
    }
    
    // تحويل أول حرف إلى UpperCase مع بقية الحروف كما هي
    name = value[0].toUpperCase() + value.substring(1);
    
    addSpecifcAnimationAction(controllerSuccess);
    return null; // Validation successful
  },
  onSaved: (value) {
  if (value != null) {
    name = value.trim(); 
  }
},

                      // onChanged: (value) {
                      //   name = value;
                      //   if (value.isNotEmpty && value.length > 2) {
                      //     name[0].toUpperCase();
                      //     addSpecifcAnimationAction(controllerSuccess);
                      //     addSpecifcAnimationAction(controllerIdle);
                      //   } else {
                      //     addSpecifcAnimationAction(controllerFail);
                      //   }
                      // },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 40),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Email",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kButtonColor),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kButtonColor),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      onChanged: (value) {
                        email = value;
                        if (value.isNotEmpty &&
                            value.length < 10 &&
                            !isLookingLeft) {
                          addSpecifcAnimationAction(controllerLookLeft);
                        } else if (value.isNotEmpty &&
                            value.length > 19 &&
                            !isLookingRight) {
                          addSpecifcAnimationAction(controllerLookRight);
                        }
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 40),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kButtonColor),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kButtonColor),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      focusNode: passwordFocusNode,
                      onChanged: (value) {
                        password = value;
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 18),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 8,
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          shape: const StadiumBorder(),
                          backgroundColor: kButtonColor,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        onPressed: () {
                          passwordFocusNode.unfocus();
                          if (email != 'null' && password != 'null') {
                            BlocProvider.of<SigninCubit>(
                              context,
                            ).UserLogin(email: email, password: password);
                          } else {
                            addSpecifcAnimationAction(controllerFail);
                          }
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
