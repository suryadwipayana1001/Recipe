import 'package:flutter/material.dart';
import 'package:recipeai/features/generate_recipe/presentations/pages/generate_recipe_page.dart';
import 'package:recipeai/features/landing/presentations/pages/culinary_page.dart';
import 'package:recipeai/features/landing/presentations/pages/discover_page.dart';
import 'package:recipeai/features/landing/presentations/pages/interactive_page.dart';
import 'package:recipeai/features/landing/presentations/pages/landing_page.dart';
import 'package:recipeai/features/landing/presentations/pages/smart_recipe_page.dart';
import 'package:recipeai/features/result_recipe/presentations/pages/results_page.dart';
import '../../features/language/presentations/pages/language_page.dart';
import '../core.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashPage.routeName:
      return MaterialPageRoute(builder: (_) => const SplashPage());
    case LanguagePage.routeName:
      return MaterialPageRoute(builder: (_) => const LanguagePage());
    case SmartRecipePage.routeName:
      return MaterialPageRoute(builder: (_) => const SmartRecipePage());
    case DiscoverPage.routeName:
      return MaterialPageRoute(builder: (_) => const DiscoverPage());
    case InteractivePage.routeName:
      return MaterialPageRoute(builder: (_) => const InteractivePage());
    case CulinaryPage.routeName:
      return MaterialPageRoute(builder: (_) => const CulinaryPage());
    case GenerateRecipePage.routeName:
      return MaterialPageRoute(builder: (_) => const GenerateRecipePage());
    case ResultPage.routeName:
      return MaterialPageRoute(builder: (_) => const ResultPage());
    case LandingPage.routeName:
      return MaterialPageRoute(builder: (_) => const LandingPage());
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
