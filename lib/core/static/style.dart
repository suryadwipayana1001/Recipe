import 'package:flutter/material.dart';
import '../core.dart';

//Receipt
TextStyle buttonTextStyle = const TextStyle(
  fontSize: textMedium,
  fontWeight: FontWeight.w500,
  color: white,
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
