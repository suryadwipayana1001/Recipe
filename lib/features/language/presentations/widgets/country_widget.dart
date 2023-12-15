import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/core.dart';
import '../../../../core/presentation/providers/core_provider.dart';

class CountryWidget extends StatefulWidget {
  final String image;
  final String text;
  final String codeLang;
  final void Function() onTap;
  const CountryWidget(
      {super.key,
      required this.image,
      required this.text,
      required this.codeLang,
      required this.onTap});

  @override
  State<CountryWidget> createState() => _CountryWidgetState();
}

class _CountryWidgetState extends State<CountryWidget> {
  final session = locator<Session>();
  @override
  Widget build(BuildContext context) {
    return Consumer<CoreProvider>(builder: (context, provider, _) {
      return GestureDetector(
        onTap: widget.onTap,
        child: Container(
          color: Colors.transparent,
          width: SizeConfig(context).appWidth(100),
          child: Row(
            children: [
              Image.asset(widget.image),
              mediumHorizontalSpacing(),
              Text(
                widget.text,
                style: mediumNormalTextStyle(),
              ),
              Spacer(),
              Visibility(
                  visible: provider.language == widget.codeLang,
                  child: Icon(Icons.check))
            ],
          ),
        ),
      );
    });
  }
}
