import 'package:go_router/go_router.dart';
import 'package:recipes_app/views/signin_view/view/signin_view.dart';



import '../views/home_view/view/home_view.dart';
import '../views/onboarding_view/view/onboarding_view.dart';
import '../views/signup_view/view/signup_view.dart';
import '../views/splash_view/view/splash_view.dart';

abstract class AppRoutes {
  static const kOnboardingView = '/onboardingView';
  static const kSearchView = '/SearchView';
   static const kHomeView = '/HomeView';
 static const kSigninView = '/SigninView';
 static const kSignupView = '/SignupView';
  static final routers = GoRouter(routes: [
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
