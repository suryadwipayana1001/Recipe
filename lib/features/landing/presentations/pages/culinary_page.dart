import 'package:flutter/material.dart';
import 'package:recipeai/core/core.dart';
import 'package:recipeai/features/generate_recipe/presentations/pages/generate_recipe_page.dart';
import 'package:recipeai/features/landing/presentations/widgets/landing_header_widget.dart';

class CulinaryPage extends StatefulWidget {
  const CulinaryPage({super.key});
  static const String routeName = '/culinary';

  @override
  State<CulinaryPage> createState() => _CulinaryPageState();
}

class _CulinaryPageState extends State<CulinaryPage> {
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
                headerSlider: 4,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: sizeExtraLarge),
                child: Image.asset(
                  pastryChef,
                  height: 300,
                ),
              ),
              Text(
                appLoc.culinary,
                textAlign: TextAlign.center,
                style: largeBoldTextStyle(),
              ),
              mediumVerticalSpacing(),
              Text(
                appLoc.culinaryDsc,
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
            final session = locator<Session>();
            session.setLanding = true;
            Navigator.pushNamed(context, GenerateRecipePage.routeName);
          },
        ),
      ),
    );
  }
}
