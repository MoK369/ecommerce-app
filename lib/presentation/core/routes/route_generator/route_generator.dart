import 'package:ecommerce/presentation/core/routes/defined_routes/defined_routes.dart';
import 'package:ecommerce/presentation/modules/authentication/screens/log_in_screen.dart';
import 'package:ecommerce/presentation/modules/authentication/screens/sign_up_screen.dart';
import 'package:ecommerce/presentation/modules/home/home_screen.dart';
import 'package:ecommerce/presentation/modules/products/screens/product_details_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case DefinedRoutes.homeScreenRouteName:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case DefinedRoutes.logInScreenRouteName:
        return MaterialPageRoute(
          builder: (context) => const LogInScreen(),
        );
      case DefinedRoutes.signUpScreenRouteName:
        return MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
        );
      case DefinedRoutes.productDetailsScreenRouteName:
        return MaterialPageRoute(
          builder: (context) => const ProductDetailsScreen(),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) {
        return Container(
          color: Colors.red,
          child: const Center(
            child: Text(
              "Error! You Have Navigated To A Wrong Route. Or Navigated With Wrong Arguments",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}
