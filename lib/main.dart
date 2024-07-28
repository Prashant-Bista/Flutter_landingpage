import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prashant_bista/firebase_options.dart';
import 'package:prashant_bista/mobile/landing_page_mobile.dart';
import 'package:prashant_bista/routes.dart';
import 'package:prashant_bista/web/landing_page_web.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => Routes.generateRoutes(settings),
      initialRoute: '/',
    );
  }
}
