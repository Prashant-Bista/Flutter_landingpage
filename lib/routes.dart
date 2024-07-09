import "package:flutter/material.dart";
import "package:prashant_bista/mobile/landing_page_mobile.dart";
import "package:prashant_bista/web/landing_page_web.dart";

class Routes {
  static Route<dynamic>? generateRoutes(RouteSettings settings) {
    return MaterialPageRoute(
        settings: settings,
        builder: (_) => LayoutBuilder(builder: (context, constrains) {
              switch (settings.name) {
                case '/':
                  if (constrains.maxWidth <= 800) {
                    return LandingPageWeb();
                  } else
                    return LandingaPageMobile();
                default:
                  if (constrains.maxWidth <= 800) {
                    return LandingPageWeb();
                  } else
                    return LandingaPageMobile();
              }
            }));
  }
}
