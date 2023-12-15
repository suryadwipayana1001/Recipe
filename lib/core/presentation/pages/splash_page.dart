import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'package:recipeai/features/landing/presentations/pages/landing_page.dart';

import '../../core.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  static const String routeName = '/splash';
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    int delay = 3;
    Future.delayed(
      Duration(seconds: delay),
      () => {Navigator.pushReplacementNamed(context, LandingPage.routeName)},
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    appLoc = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: [Text("Test")],
      ),
    );
  }
}
