import 'package:flutter/material.dart';
import 'package:recipeai/core/core.dart';

class CustomError extends StatefulWidget {
  String text;
  CustomError({super.key, required this.text});

  @override
  State<CustomError> createState() => _CustomErrorState();
}

class _CustomErrorState extends State<CustomError> {
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
              widget.text,
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
