import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:recipeai/features/landing/presentations/pages/landing_page.dart';
import '../../../../core/core.dart';
import '../../../../core/presentation/providers/core_provider.dart';
import '../widgets/country_widget.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});
  static const String routeName = '/language';

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    appLoc = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: white,
      body: Consumer<CoreProvider>(
        builder: (context, provider, _) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: SizeConfig(context).appHeight(60),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(cooking),
                        Text(
                          appLoc.appName,
                          style: largeBoldTextStyle(),
                        ),
                        smallVerticalSpacing(),
                        Text("V 1.0.0")
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(sizeMedium),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          appLoc.selectLanguage,
                          style: largeBoldTextStyle(),
                        ),
                        largeVerticalSpacing(),
                        CountryWidget(
                          image: english,
                          text: "English",
                          codeLang: "en",
                          onTap: () {
                            locator<Session>().setLanguage = "en";
                            provider.setLanguage = "en";
                            printWarning(provider.language);
                          },
                        ),
                        largeVerticalSpacing(),
                        CountryWidget(
                          image: indonesia,
                          text: "Indonesia",
                          codeLang: "id",
                          onTap: () {
                            locator<Session>().setLanguage = "id";
                            provider.setLanguage = "id";
                            printWarning(provider.language);
                          },
                        ),
                        largeVerticalSpacing(),
                        // CustomButton(
                        //   width: SizeConfig(context).appWidth(100),
                        //   text: appLoc.next,
                        //   onPressed: () {
                        //     Navigator.pushNamed(context, LandingPage.routeName);
                        //   },
                        // ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(sizeMedium),
        child: CustomButton(
          width: SizeConfig(context).appWidth(100),
          text: appLoc.next,
          onPressed: () {
            Navigator.pushNamed(context, LandingPage.routeName);
          },
        ),
      ),
    );
  }
}
