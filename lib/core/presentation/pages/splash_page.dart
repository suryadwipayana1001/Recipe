import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:recipeai/features/language/presentations/pages/language_page.dart';

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
      () => {Navigator.pushReplacementNamed(context, LanguagePage.routeName)},
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    appLoc = AppLocalizations.of(context)!;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(bgImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              logo,
              width: 150,
            ),
            largeVerticalSpacing(),
            Center(
              child: Text(
                appLoc.appName,
                style: largeBoldTextStyle(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
