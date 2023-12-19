import 'package:flutter/material.dart';
import '../../core.dart';

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
    this.automaticallyImplyLeading = false,
  });
  final Widget body;
  final Color bgColor;
  final bool replacePage;
  final String? decoration;
  final Widget? floatingActionButton;
  final String? title;
  final bool? withoutImage;
  final bool automaticallyImplyLeading;
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
      backgroundColor: white,
      key: _key,
      appBar: CustomAppBar(
        automaticallyImplyLeading: widget.automaticallyImplyLeading,
        title: widget.title,
        onTap: () {
          _key.currentState!.openDrawer();
        },
      ),
      // drawer: CustomDrawer(replacePage: widget.replacePage),
      body: widget.body,
      floatingActionButtonLocation: widget.floatingActionButtonLocation,
      floatingActionButton: widget.floatingActionButton,
    );
  }
}
