import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import 'landing_header_widget.dart';

class InteractiveWidget extends StatelessWidget {
  const InteractiveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(sizeMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          LandingHeaderWidget(
            headerSlider: 3,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
          )
        ],
      ),
    );
  }
}
