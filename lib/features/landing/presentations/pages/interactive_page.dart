import 'package:flutter/material.dart';
import 'package:recipeai/core/core.dart';
import 'package:recipeai/features/landing/presentations/pages/culinary_page.dart';
import 'package:recipeai/features/landing/presentations/widgets/landing_header_widget.dart';

class InteractivePage extends StatefulWidget {
  const InteractivePage({super.key});
  static const String routeName = '/interactive';

  @override
  State<InteractivePage> createState() => _InteractivePageState();
}

class _InteractivePageState extends State<InteractivePage> {
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
                headerSlider: 3,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: sizeExtraLarge),
                child: Image.asset(
                  suhshiCook,
                  height: 300,
                ),
              ),
              Text(
                appLoc.interactive,
                textAlign: TextAlign.center,
                style: largeBoldTextStyle(),
              ),
              mediumVerticalSpacing(),
              Text(
                appLoc.interactiveDsc,
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
            Navigator.pushNamed(context, CulinaryPage.routeName);
          },
        ),
      ),
    );
  }
}
