import 'package:go_router/go_router.dart';
import 'package:recipes_app/views/home_view/view/home_view.dart';
import 'package:recipes_app/views/onboarding_view/view/onboarding_view.dart';
import 'package:recipes_app/views/profile_view/view/profile_view.dart';
import 'package:recipes_app/views/recipes_details_view/view/recipes_details_view.dart';
import 'package:recipes_app/views/saved_view/view/saved_view.dart';
import 'package:recipes_app/views/signin_view/view/signin_view.dart';
import 'package:recipes_app/views/signup_view/view/sign_up_view.dart';
import 'package:recipes_app/views/splash_view/view/splash_view.dart';

abstract class AppRoutes {
  static const kOnboardingView = '/onboardingView';
  static const kHomeView = '/homeView';
  static const kSigninView = '/signinView';
  static const kSignupView = '/signupView';
  static const kSavedView = '/savedView';
  static const kProfileView = '/profileView';
  static const kRecipesDetailsView = '/recipesDetailsView';

  /// Method to determine the initial route dynamically
  
  static GoRouter getRouter({required bool isLoggedIn}) {
    return GoRouter(
     initialLocation: isLoggedIn ? kHomeView : '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const SplashView(),
        ),
        GoRoute(
          path: kOnboardingView,
          builder: (context, state) => const OnboardingView(),
        ),
        GoRoute(
          path: kHomeView,
          builder: (context, state) => const HomeView(),
        ),
        GoRoute(
          path: kSigninView,
          builder: (context, state) => const SignInView(),
        ),
        GoRoute(
          path: kSignupView,
          builder: (context, state) => const SignUpView(),
        ),
        GoRoute(
          path: kSavedView,
          builder: (context, state) => const SavedView(),
        ),
        GoRoute(
          path: kProfileView,
          builder: (context, state) => const ProfileView(),
        ),
        GoRoute(
          path: kRecipesDetailsView,
          builder: (context, state) => const RecipesDetailsView(),
        ),
      ],
    );
  }
}