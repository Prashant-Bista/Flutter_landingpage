import "package:flutter/material.dart";
import "package:prashant_bista/mobile/about_mobile.dart";
import "package:prashant_bista/mobile/contact_mobile.dart";
import "package:prashant_bista/mobile/landing_page_mobile.dart";
import "package:prashant_bista/web/about_web.dart";
import "package:prashant_bista/web/contact_web.dart";
import "package:prashant_bista/web/landing_page_web.dart";

class Routes {
  static Route<dynamic>? generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => LayoutBuilder(builder: (context, constrains) {
                  if (constrains.maxWidth >= 800) {
                    return LandingPageWeb();
                  } else
                    return LandingaPageMobile();
                }));
      case '/contact':
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => LayoutBuilder(builder: (context, constraits) {
              if (constraits.maxWidth >= 800)
                return ContactWeb();
              else
                return ContactMobile();
            }));
      case '/about':
        return MaterialPageRoute(settings:settings, builder: (_)=>LayoutBuilder(builder: (context,constraints){
          if(constraints.maxWidth>800)
          return AboutWeb();
          else
            return AboutMobile();
        }));
      default:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => LayoutBuilder(builder: (context, constraints) {
                  if (constraints.maxWidth >= 800)
                    return LandingPageWeb();
                  else
                    return LandingaPageMobile();
                }));
    }
  }
}
