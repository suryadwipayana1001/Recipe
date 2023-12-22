import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:recipeai/core/presentation/providers/drawer_provider.dart';
import 'core/core.dart';
import 'core/presentation/providers/core_provider.dart';
import 'core/presentation/providers/loading_provider.dart';
import 'core/route/route.dart' as router;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

final session = locator<Session>();

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoadingProvider>(
            create: (_) => locator<LoadingProvider>()),
        ChangeNotifierProvider<CoreProvider>(
            create: (_) => locator<CoreProvider>()),
        ChangeNotifierProvider<DrawerProvider>(
            create: (_) => locator<DrawerProvider>()),
      ],
      builder: (context, _) {
        return Consumer<CoreProvider>(builder: (context, provider, _) {
          return MaterialApp(
            navigatorKey: locator<GlobalKey<NavigatorState>>(),
            debugShowCheckedModeBanner: false,
            onGenerateRoute: router.generateRoute,
            locale: Locale("${locator<Session>().isLang}", ''),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            theme: ThemeData(
                // useMaterial3: false,
                ),
            supportedLocales: [
              Locale('en', ''),
              Locale('id', ''),
            ],
            home: const SplashPage(),
          );
        });
      },
    );
  }
}
