import 'package:flutter/material.dart';
import 'package:recipeai/core/core.dart';

class LandingHeaderWidget extends StatefulWidget {
  LandingHeaderWidget({super.key, required this.headerSlider});
  int headerSlider = 1;

  @override
  State<LandingHeaderWidget> createState() => _LandingHeaderWidgetState();
}

class _LandingHeaderWidgetState extends State<LandingHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            height: 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: widget.headerSlider == 1 ? black : gray,
            ),
          ),
        ),
        mediumHorizontalSpacing(),
        Expanded(
          child: Container(
            height: 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: widget.headerSlider == 2 ? black : gray,
            ),
          ),
        ),
        mediumHorizontalSpacing(),
        Expanded(
          child: Container(
            height: 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: widget.headerSlider == 3 ? black : gray,
            ),
          ),
        ),
        mediumHorizontalSpacing(),
        Expanded(
          child: Container(
            height: 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: widget.headerSlider == 4 ? black : gray,
            ),
          ),
        )
      ],
    );
  }
}
