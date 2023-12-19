import 'package:flutter/material.dart';
import 'package:recipeai/core/core.dart';

class CustomError extends StatelessWidget {
  const CustomError({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(error),
            smallVerticalSpacing(),
            Text(
              appLoc.serverError,
              textAlign: TextAlign.center,
              style: errorTextStyle,
            ),
            Text(
              appLoc.tryMoment,
              style: mediumNormalTextStyle(),
              textAlign: TextAlign.center,
            ),
            mediumVerticalSpacing(),
            CustomButton(
              height: 40,
              width: 80,
              text: "OK",
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
