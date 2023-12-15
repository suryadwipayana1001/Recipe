import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core.dart';
import 'custom_drawer.dart';

class AppContainer extends StatefulWidget {
  const AppContainer({
    super.key,
    required this.body,
    this.bgColor = white,
    this.replacePage = false,
    this.decoration,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.title,
    this.resizeToAvoidBottomInset = true,
    this.withoutImage = false,
  });
  final Widget body;
  final Color bgColor;
  final bool replacePage;
  final String? decoration;
  final Widget? floatingActionButton;
  final String? title;
  final bool? withoutImage;

  final bool resizeToAvoidBottomInset;

  final FloatingActionButtonLocation? floatingActionButtonLocation;

  @override
  State<AppContainer> createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
      backgroundColor: widget.bgColor,
      key: _key,
      appBar: CustomAppBar(
        title: widget.title,
        onTap: () {
          _key.currentState!.openDrawer();
        },
      ),
      // drawer: CustomDrawer(replacePage: widget.replacePage),
      body: Container(
          decoration: BoxDecoration(
              color: widget.bgColor,
              image: widget.withoutImage == true
                  ? null
                  : DecorationImage(
                      image: AssetImage(bgImage), fit: BoxFit.cover)),
          child: widget.body),
      floatingActionButtonLocation: widget.floatingActionButtonLocation,
      floatingActionButton: widget.floatingActionButton,
    );
  }
}
