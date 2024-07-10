import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prashant_bista/components.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingaPageMobile extends StatefulWidget {
  const LandingaPageMobile({super.key});

  @override
  State<LandingaPageMobile> createState() => _LandingaPageMobileState();
}

class _LandingaPageMobileState extends State<LandingaPageMobile> {
  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(
          size: 35.0,
          color: Colors.black,
        ),
      ),
      endDrawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DrawerHeader(
                padding: EdgeInsets.only(bottom: 20),
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 2.0, color: Colors.black)),
                  child: Image.asset('assets/PP-circle.png'),
                )),
            TabsMobile(text: "Home", route: "/"),
            SizedBox(
              height: 20,
            ),
            TabsMobile(text: "About", route: '/about'),
            SizedBox(
              height: 20,
            ),
            TabsMobile(text: "Works", route: '/works'),
            SizedBox(
              height: 20,
            ),
            TabsMobile(text: "Blog", route: '/blog'),
            SizedBox(
              height: 20,
            ),
            TabsMobile(text: "Contact", route: '/contact'),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () async => await launchUrl(Uri.parse(
                        "https:://www.instagram.com/prashantbista7/")),
                    icon: SvgPicture.asset(
                      "assets/instagram.svg",
                      height: 25,
                      width: 25,
                    )),
                IconButton(
                    onPressed: () async => await launchUrl(
                        Uri.parse("https://github.com/Prashant-Bista")),
                    icon: SvgPicture.asset(
                      "assets/github.svg",
                      height: 25,
                      width: 25,
                    )),
                IconButton(
                    onPressed: () async => await launchUrl(Uri.parse(
                        "https://www.linkedin.com/in/prashant-bista-9016b5270/")),
                    icon: Image.asset(
                      "assets/linkedin.png",
                      height: 25,
                      width: 25,
                    ))
              ],
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 117.0,
                  backgroundColor: Colors.lightBlueAccent,
                  child: CircleAvatar(
                    radius: 110.0,
                    backgroundImage: AssetImage("assets/PP-circle.png"),
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                        color: Colors.lightBlueAccent,
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: SansBold("Hello I'm", 15.0),
                    ),
                    SansBold("Prashant Bista", 30.0),
                    SansBold("Flutter Developer", 15.0),
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Wrap(
                    direction: Axis.vertical,
                    spacing: 3.0,
                    children: [
                      Icon(Icons.email),
                      Icon(Icons.call),
                      Icon(Icons.location_pin)
                    ],
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Wrap(
                    direction: Axis.vertical,
                    spacing: 9.0,
                    children: [
                      Sans("prashantbista@gmail.com", 15.0),
                      Sans("9812345678", 15.0),
                      Sans("221B Baker Street", 15.0)
                    ],
                  ),
                ])
              ],
            ),
          ),
        ],
      ),
    );
  }
}
