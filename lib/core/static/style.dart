import 'package:flutter/material.dart';
import '../core.dart';

//Receipt
TextStyle buttonTextStyle({Color? color = white}) => TextStyle(
      fontSize: textMedium,
      fontWeight: FontWeight.w500,
      color: color,
    );

TextStyle largeBoldTextStyle({Color? color = black}) => TextStyle(
      fontSize: textLarge,
      color: color,
      fontWeight: FontWeight.bold,
    );
TextStyle mediumNormalTextStyle({Color? color = black}) => TextStyle(
      fontSize: textMedium,
      color: color,
      fontWeight: FontWeight.normal,
    );
TextStyle hintTextStyle = TextStyle(
  fontSize: textSmall,
  color: gray,
  fontWeight: FontWeight.w300,
);

TextStyle errorTextStyle = TextStyle(
  fontSize: textMedium,
  color: Colors.red,
  fontWeight: FontWeight.w600,
);
