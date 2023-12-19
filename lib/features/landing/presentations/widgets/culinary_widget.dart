import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import 'landing_header_widget.dart';

class CulinaryWidget extends StatelessWidget {
  const CulinaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(sizeMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          LandingHeaderWidget(
            headerSlider: 4,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
          )
        ],
      ),
    );
  }
}
