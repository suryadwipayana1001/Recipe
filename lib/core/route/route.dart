import 'package:flutter/material.dart';
import 'package:recipeai/features/generate_recipe/presentations/pages/generate_recipe_page.dart';
import 'package:recipeai/features/landing/presentations/pages/landing_page.dart';
import 'package:recipeai/features/result_recipe/presentations/pages/results_page.dart';
import '../../features/favorite/presentations/pages/favorite_page.dart';
import '../../features/language/presentations/pages/language_page.dart';
import '../core.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashPage.routeName:
      return MaterialPageRoute(builder: (_) => const SplashPage());
    case LanguagePage.routeName:
      return MaterialPageRoute(builder: (_) => const LanguagePage());
    case GenerateRecipePage.routeName:
      return MaterialPageRoute(builder: (_) => const GenerateRecipePage());
    case ResultPage.routeName:
      return MaterialPageRoute(builder: (_) => const ResultPage());
    case LandingPage.routeName:
      return MaterialPageRoute(builder: (_) => const LandingPage());
    case FavoritePage.routeName:
      final args = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        builder: (_) => FavoritePage(
          result: args['result'],
        ),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}
