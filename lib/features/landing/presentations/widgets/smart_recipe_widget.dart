import 'package:flutter/material.dart';
import '../../../../core/core.dart';
import 'landing_header_widget.dart';

class SmartRecipeWidget extends StatelessWidget {
  const SmartRecipeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
