import 'package:flutter/material.dart';

import '../../core.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final double? height;
  final double? width;
  final double? circular;
  final TextStyle? textStyle;
  final BorderRadius? borderRadius;
  final double? elevation;
  final Color? backgroundColor;
  final Color? borderColor;
  final void Function() onPressed;

  CustomButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.height,
      this.width,
      this.circular,
      this.borderRadius,
      this.textStyle,
      this.elevation,
      this.borderColor,
      this.backgroundColor})
      : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.backgroundColor ?? buttonColor,
        padding: EdgeInsets.all(paddingSizeExtraSmall),
        elevation: widget.elevation ?? 2.0,
        fixedSize: Size(widget.width ?? 80.0, widget.height ?? 50.0),
        shape: RoundedRectangleBorder(
            borderRadius: widget.borderRadius ??
                BorderRadius.circular(widget.circular ?? 20.0),
            side: BorderSide(color: widget.borderColor ?? buttonColor)),
      ),
      onPressed: widget.onPressed,
      child: Text(
        widget.text,
        style: widget.textStyle ?? buttonTextStyle(),
      ),
    );
  }
}
