import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../core.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: const EdgeInsets.all(sizeLarge),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                deconstructed,
              ),
            ),
            mediumVerticalSpacing(),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    appLoc.loading,
                    style: mediumNormalTextStyle(),
                    textAlign: TextAlign.center,
                  ),
                  smallHorizontalSpacing(),
                  Container(
                    child: LoadingAnimationWidget.discreteCircle(
                      color: gray,
                      secondRingColor: green,
                      thirdRingColor: buttonColor,
                      size: 18,
                    ),
                  ),
                ]),
            Text(
              appLoc.createRecipe,
              style: mediumNormalTextStyle(),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
