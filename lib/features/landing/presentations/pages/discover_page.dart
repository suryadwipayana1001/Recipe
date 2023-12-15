import 'package:flutter/material.dart';
import 'package:recipeai/core/core.dart';
import 'package:recipeai/features/landing/presentations/pages/interactive_page.dart';
import 'package:recipeai/features/landing/presentations/widgets/landing_header_widget.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});
  static const String routeName = '/discover';

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
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
                headerSlider: 2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: sizeExtraLarge),
                child: Image.asset(
                  koreanFoods,
                  height: 300,
                ),
              ),
              Text(
                appLoc.discover,
                textAlign: TextAlign.center,
                style: largeBoldTextStyle(),
              ),
              mediumVerticalSpacing(),
              Text(
                appLoc.discoverDsc,
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
            Navigator.pushNamed(context, InteractivePage.routeName);
          },
        ),
      ),
    );
  }
}
