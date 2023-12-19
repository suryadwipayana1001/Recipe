import 'package:flutter/material.dart';
import '../../../../core/core.dart';
import 'landing_header_widget.dart';

class DiscoverWigdet extends StatelessWidget {
  const DiscoverWigdet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(sizeMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          LandingHeaderWidget(
            headerSlider: 2,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
          )
        ],
      ),
    );
  }
}
