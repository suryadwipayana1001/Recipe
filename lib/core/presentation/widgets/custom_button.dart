import 'package:flutter/material.dart';

import '../../core.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final double? height;
  final double? width;
  final double? circular;
  final void Function() onPressed;

  CustomButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.height,
      this.width,
      this.circular})
      : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        padding: EdgeInsets.all(paddingSizeExtraSmall),
        elevation: 2.0,
        fixedSize: Size(widget.width ?? 80.0, widget.height ?? 50.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.circular ?? 20.0),
        ),
      ),
      onPressed: widget.onPressed,
      child: Text(
        widget.text,
        style: buttonTextStyle,
      ),
    );
  }
}
