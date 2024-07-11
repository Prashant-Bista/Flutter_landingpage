import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prashant_bista/components.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactWeb extends StatefulWidget {
  const ContactWeb({super.key});

  @override
  State<ContactWeb> createState() => _ContactWebState();
}

class _ContactWebState extends State<ContactWeb> {
  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      endDrawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 72.0,
              backgroundColor: Colors.lightBlueAccent,
              child: CircleAvatar(
                radius: 70.0,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("assets/PP-circle.png"),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            SansBold("Prashant Bista", 30.0),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () async {
                      await launchUrl(Uri.parse(
                          "https://www.instagram.com/prashantbista7/"));
                    },
                    icon: SvgPicture.asset(
                      "assets/instagram.svg",
                      color: Colors.black,
                      width: 35.0,
                    )),
                IconButton(
                    onPressed: () async {
                      await launchUrl(
                          Uri.parse("https://github.com/Prashant-Bista"));
                    },
                    icon: SvgPicture.asset(
                      "assets/github.svg",
                      color: Colors.black,
                      width: 35.0,
                    )),
                IconButton(
                    onPressed: () async {
                      await launchUrl(Uri.parse(
                          "https://www.linkedin.com/in/prashant-bista-9016b5270/"));
                    },
                    icon: Image.asset(
                      "assets/linkedin.png",
                      width: 35.0,
                    )),
              ],
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
