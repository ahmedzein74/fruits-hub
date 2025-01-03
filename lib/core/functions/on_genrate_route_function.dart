import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/services/get_it_services.dart';
import 'package:fruits_hub/features/auth/domain/repo/auth_repo.dart';
import 'package:fruits_hub/features/auth/presentation/controller/signin_cubit/signin_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/controller/signup_cubit/signup_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/views/signin_view.dart';
import 'package:fruits_hub/features/auth/presentation/views/signup_view.dart';
import 'package:fruits_hub/features/best_selling_fruits/presentation/views/best_selling_view.dart';
import 'package:fruits_hub/features/home/presentation/views/home_view.dart';
import 'package:fruits_hub/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:fruits_hub/features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());

    case BestSellingView.routeName:
      return MaterialPageRoute(builder: (context) => const BestSellingView());
    case SignInView.routeName:
      return MaterialPageRoute(
          builder: (context) => BlocProvider(
                create: (context) => SignInCubit(getIt<AuthRepo>()),
                child: const SignInView(),
              ));
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
    case SignUpView.routeName:
      return MaterialPageRoute(
          builder: (context) => BlocProvider(
                create: (context) => SignUpCubit(getIt<AuthRepo>()),
                child: const SignUpView(),
              ));
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
