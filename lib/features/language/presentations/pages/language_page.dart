import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:recipeai/features/generate_recipe/presentations/pages/generate_recipe_page.dart';
import 'package:recipeai/features/landing/presentations/pages/smart_recipe_page.dart';
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
      body: Consumer<CoreProvider>(
        builder: (context, provider, _) {
          return SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(cooking),
                      Text(
                        appLoc.appName,
                        style: largeBoldTextStyle(),
                      ),
                      Text("V 1.0.0")
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(sizeLarge),
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
                          provider.setLanguage = "id";
                          printWarning(provider.language);
                        },
                      ),
                      largeVerticalSpacing(),
                      CustomButton(
                        width: SizeConfig(context).appWidth(100),
                        text: appLoc.next,
                        onPressed: () {
                          final session = locator<Session>();
                          if (!session.isLanding) {
                            Navigator.pushNamed(
                                context, SmartRecipePage.routeName);
                          } else {
                            Navigator.pushNamed(
                                context, GenerateRecipePage.routeName);
                          }
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
