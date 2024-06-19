import 'package:flutter/material.dart';
import 'package:prashant_bista/mobile/landing_page_mobile.dart';
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
      home: LayoutBuilder(
        builder: (context, constraints){
          if(constraints.maxWidth>800){
            return LandingPageWeb();
          }

          else {
            return LandingaPageMobile();
          }
        },
      )
    );
  }
}

