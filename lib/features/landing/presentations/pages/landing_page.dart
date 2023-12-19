import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:recipeai/features/generate_recipe/presentations/pages/generate_recipe_page.dart';
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
      backgroundColor: white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 1.0,
                  height: SizeConfig(context).appHeight(87),
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
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
              extraLargeVerticalSpacing()
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(sizeMedium),
        child: CustomButton(
          width: SizeConfig(context).appWidth(100),
          text: appLoc.next,
          onPressed: () {
            Navigator.pushNamed(context, GenerateRecipePage.routeName);
          },
        ),
      ),
    );
  }
}
