import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
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
        extendBodyBehindAppBar: true,
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
            //Intro, first section
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
            SizedBox(
              height: 90.0,
            ),
            //About me, second section
            Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SansBold("About Me", 40.0),
                    Sans(
                        "Hello! I'm Prashant Bista. I specialize in flutter UI development",
                        15.0),
                    Sans(
                        "I don't plan to stay a frontend developer. Soon, there will be more from me.",
                        15.0),
                    SizedBox(
                      height: 10,
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
            SizedBox(
              height: 60.0,
            ),
            //what I do?, Third section
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SansBold("What I do", 40.0),
                AnimatedCardWeb(
                  imagepath: "assets/webL.png",
                  text: "Web Development",
                  width: 300.0,
                ),
                SizedBox(height: 35.0),
                AnimatedCardWeb(
                  imagepath: "assets/app.png",
                  text: "App Development",
                  width: 300.0,
                  fit: BoxFit.contain,
                  reverse: true,
                ),
                SizedBox(height: 35.0),
                AnimatedCardWeb(
                  imagepath: "assets/firebase.png",
                  text: "Backend Development",
                  width: 300.0,
                ),
                SizedBox(
                  height: 60,
                ),
                //Contact, Fourth sectoin
                Wrap(
                  runSpacing: 20.0,
                  spacing: 20.0,
                  alignment: WrapAlignment.center,
                  children: [
                    SansBold("Contact Me", 40.0),
                  ],
                ),
                SizedBox(height: 30),
                Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: [
                    TextForm(
                        text: "First Name",
                        hintText: "Please Enter your first Name",
                        Containerwidth: widthDevice / 1.4),
                    TextForm(
                        text: "Last Name",
                        hintText: "Please Enter your last Name",
                        Containerwidth: widthDevice / 1.4),
                    TextForm(
                        text: "Email",
                        hintText: "Please Enter your email address",
                        Containerwidth: widthDevice / 1.4),
                    TextForm(
                        text: "Phone number",
                        hintText: "Please Enter your Phone number",
                        Containerwidth: widthDevice / 1.4),
                    TextForm(
                      text: "Message Here",
                      hintText: "Please Enter your Message",
                      Containerwidth: widthDevice / 1.4,
                      maxlines: 10,
                    ),
                  ],
                ),
                MaterialButton(
                  child: SansBold("Submit", 30.0),
                  color: Colors.lightBlueAccent,
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  height: 60.0,
                  minWidth: widthDevice / 2.2,
                )
              ],
            ),
          ],
        ));
  }
}
