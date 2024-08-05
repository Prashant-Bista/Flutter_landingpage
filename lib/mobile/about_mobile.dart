import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components.dart';
class AboutMobile extends StatefulWidget {
  const AboutMobile({super.key});

  @override
  State<AboutMobile> createState() => _AboutMobileState();
}

class _AboutMobileState extends State<AboutMobile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(
          size: 35.0,
          color: Colors.black,
        ),
      ),
      endDrawer:DrawersMobile(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: [
            //Introduciton, first section
            CircleAvatar(
              radius: 117.0,
              backgroundColor: Colors.lightBlueAccent,
              child: CircleAvatar(
                radius: 113.0,
                backgroundColor: Colors.black,
                child:CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 110.0,
                  backgroundImage: AssetImage('assets/PP-circle.png',),
                )
              ),
            ),
            SizedBox(height: 20.0,),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SansBold("About Me", 40.0),
                    SizedBox(height: 10.0,),
                    Sans(
                        "Hello! I'm Prashant Bista. I specialize in flutter UI development",
                        15.0),
                    Sans(
                        "I don't plan to stay a frontend developer. Soon, there will be more from me.",
                        15.0),
                    SizedBox(
                      height: 15.0,
                    ),
                    Wrap(
                      spacing: 7.0,
                      runSpacing: 7.0,
                      children: [
                        BlueContainer(text: "Flutter"),
                        BlueContainer(text: "Firebase"),
                        BlueContainer(text: "Android"),
                        BlueContainer(text: "Widows")
                      ],
                    )
                  ],
                )),
            SizedBox(height: 40.0,),
            //Second section,web development
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [AnimatedCard(imagepath: "assets/webL.png",),
              SizedBox(height: 30.0,),
                SansBold("Web development", 20.0),
                SizedBox(height: 10,),


              ],
            ),
            Center(child: Sans("I'm here to help you go online with web apps",15.0)),
            //app development
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20.0,),
                AnimatedCard(imagepath: "assets/app.png",width: 200.00,reverse: true,),
                SizedBox(height: 30.0,),
                SansBold("App Development", 20.0),
                SizedBox(height: 10.0,)
              ],
            ),
            Center(child: Sans("I got you covered in case you need a beautiful responsive and a hight performance app", 15.0)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20.0,),
                AnimatedCard(imagepath: "assets/firebase.png",width: 200.00,reverse: true,),
                SizedBox(height: 30.0,),
                SansBold("Back-end Development", 20.0),
                SizedBox(height: 10.0,)
              ],

            ),
            Center(child: Sans("I can make you highly scalable and secure back-end",15.0)),
            SizedBox(height: 30.0,)

          ],
        ),
      ),
    ));
  }
}
