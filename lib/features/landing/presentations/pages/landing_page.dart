import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:recipeai/features/generate_recipe/presentations/pages/generate_recipe_page.dart';
import 'package:recipeai/features/landing/presentations/pages/culinary_page.dart';
import 'package:recipeai/features/landing/presentations/pages/discover_page.dart';
import 'package:recipeai/features/landing/presentations/pages/interactive_page.dart';
import 'package:recipeai/features/landing/presentations/pages/smart_recipe_page.dart';
import 'package:recipeai/features/landing/presentations/widgets/culinary_widget.dart';
import 'package:recipeai/features/landing/presentations/widgets/discover_widget.dart';
import 'package:recipeai/features/landing/presentations/widgets/interactive_widget.dart';
import 'package:recipeai/features/landing/presentations/widgets/smart_recipe_widget.dart';
import '../../../../core/core.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});
  static const String routeName = '/landing';
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    appLoc = AppLocalizations.of(context)!;
    return Scaffold(
      body: SafeArea(
        child: CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1.0,
            height: SizeConfig(context).appHeight(100),
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 5),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
          ),
          items: [
            SmartRecipeWidget(),
            DiscoverWigdet(),
            InteractiveWidget(),
            CulinaryWidget()
          ].map(
            (i) {
              return i;
            },
          ).toList(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(sizeMedium),
        child: CustomButton(
          width: SizeConfig(context).appWidth(100),
          text: appLoc.next,
          onPressed: () {
            final session = locator<Session>();
            session.setLanding = true;
            Navigator.pushNamed(context, GenerateRecipePage.routeName);
          },
        ),
      ),
    );
  }
}
