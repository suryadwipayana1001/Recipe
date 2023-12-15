import 'package:flutter/material.dart';
import 'package:recipeai/core/core.dart';
import 'package:recipeai/features/landing/presentations/pages/discover_page.dart';
import 'package:recipeai/features/landing/presentations/widgets/landing_header_widget.dart';

class SmartRecipePage extends StatefulWidget {
  const SmartRecipePage({super.key});
  static const String routeName = '/smartRecipe';

  @override
  State<SmartRecipePage> createState() => _SmartRecipePageState();
}

class _SmartRecipePageState extends State<SmartRecipePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(sizeMedium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              LandingHeaderWidget(
                headerSlider: 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: sizeExtraLarge),
                child: Image.asset(
                  deconstructed,
                  height: 300,
                ),
              ),
              Text(
                appLoc.smartRecipe,
                textAlign: TextAlign.center,
                style: largeBoldTextStyle(),
              ),
              mediumVerticalSpacing(),
              Text(
                appLoc.smartRecipeDsc,
                style: mediumNormalTextStyle(),
                textAlign: TextAlign.center,
              ),
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
            Navigator.pushNamed(context, DiscoverPage.routeName);
          },
        ),
      ),
    );
  }
}
