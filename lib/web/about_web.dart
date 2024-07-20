import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components.dart';
class AboutWeb extends StatefulWidget {
  const AboutWeb({super.key});

  @override
  State<AboutWeb> createState() => _AboutWebState();
}

class _AboutWebState extends State<AboutWeb> {

  @override
  Widget build(BuildContext context) {
    urlLauncher(String impath, String url) {
      return IconButton(
          onPressed: () async {
            await launchUrl(Uri.parse(url));
          },
          icon: Image.asset(
            impath,
            width: 35.0,
            height: 35.0,
          ));
    }
    var widthdevice = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Drawer(
        //To create a drawer menu
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
              height: 50.0,
            ),
            SansBold("Prashant Bisa", 30.0),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                urlLauncher("assets/instagram.png",
                    "https://www.instagram.com/prashantbista7/"),
                urlLauncher(
                    "assets/github.png", "https://github.com/Prashant-Bista"),
                urlLauncher("assets/linkedin.png",
                    "https://www.linkedin.com/in/prashant-bista-9016b5270/")
              ],
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        //Extra elevation creates a bad separation between
        //appbar and rest of the body
        iconTheme: IconThemeData(size: 25.0, color: Colors.orange),
        title: Row(
          children: [
            Spacer(
              flex: 3,
            ),
            TabsWeb(
              title: "Home",
              route: '/',
            ),
            Spacer(),
            TabsWeb(
              title: "Works",
              route: "/works",
            ),
            Spacer(),
            TabsWeb(
              title: "Blogs",
              route: "/blogs",
            ),
            Spacer(),
            TabsWeb(
              title: "About",
              route: "/about",
            ),
            Spacer(),
            TabsWeb(
              title: "Contact",
              route: "/contact",
            ),
            Spacer(),
          ],
        ),
      ),
      body: ListView(
        //About me, first Section
        children: [
          SizedBox(height: 500.0,
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SansBold("About Me", 40.0)
                ],
              )
            ],

          ) 
            ,)
          
        ],
      ),
    );
  }

  urlLauncher(String s, String t) {}
}
