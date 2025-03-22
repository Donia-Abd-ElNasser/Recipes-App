import 'package:go_router/go_router.dart';
import 'package:recipes_app/views/profile_view/view/profile_view.dart';
import 'package:recipes_app/views/recipes_details_view/view/recipes_details_view.dart';
import 'package:recipes_app/views/signin_view/view/signin_view.dart';



import '../views/home_view/view/home_view.dart';
import '../views/onboarding_view/view/onboarding_view.dart';
import '../views/saved_view/view/saved_view.dart';
import '../views/signup_view/view/sign_up_view.dart';

import '../views/splash_view/view/splash_view.dart';

abstract class AppRoutes {
  static const kOnboardingView = '/onboardingView';
  static const kSearchView = '/SearchView';
   static const kHomeView = '/HomeView';
 static const kSigninView = '/SigninView';
 static const kSignupView = '/SignupView';
  static const kSavedView = '/FavouriteView';
   static const kProfileView = '/Profileiew';
   static const kRecipesDetailsView='/RecipesView';
  static final routers = GoRouter(routes: [
    GoRoute(
      path: 'ikjlkn',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: kOnboardingView,
      builder: (context, state) => const OnboardingView(),
    ),
    GoRoute(
      path: '/',
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
    // GoRoute(
    //   path: '/BookDetailsView',
    //   builder: (context, state) => BlocProvider(
    //     create: (context) => SimilarBooksCubit(getIt.get<HomeReposImpl>()),
    //     child:  BookDetailsView(
    //       bookModel: state.extra as BookModel,
    //     ),
    //   ),
    // ),
    // GoRoute(
    //   path: '/SearchView',
    //   builder: (context, state) => const SearchView(),
    // )
  ]);
}
