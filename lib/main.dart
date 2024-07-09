import 'package:flutter/material.dart';
import 'package:prashant_bista/mobile/landing_page_mobile.dart';
import 'package:prashant_bista/routes.dart';
import 'package:prashant_bista/web/landing_page_web.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) => Routes.generateRoutes(settings),
      initialRoute: '/',
    );
  }
}
