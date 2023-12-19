import 'package:flutter/material.dart';
import 'core/core.dart';
import 'main_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await locatorInit();
    locator.isReady<Session>().then((_) async {
      return runApp(const MainApp());
    });
  } catch (e) {
    logMe(e);
  }
}
