import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
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
    return SafeArea(
      child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            iconTheme: const IconThemeData(
              size: 35.0,
              color: Colors.black,
            ),
          ),
          endDrawer: DrawersMobile(),
          body: ListView(
            children: [
              const CircleAvatar(
                radius: 117.0,
                backgroundColor: Colors.lightBlueAccent,
                child: CircleAvatar(
                  radius: 110.0,
                  backgroundImage: AssetImage("assets/PP-circle.png"),
                ),
              ),
              //Intro, first section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
      
                   const SizedBox(
                      height: 25.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                            color: Colors.lightBlueAccent,
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          child:const SansBold("Hello I'm", 15.0),
                        ),
                        const SansBold("Prashant Bista", 30.0),
                        const SansBold("Flutter Developer", 15.0),
                      ],
                    ),
                    const Row(mainAxisAlignment: MainAxisAlignment.start, children: [
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
              const SizedBox(
                height: 90.0,
              ),
              //About me, second section
             const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
              const SizedBox(
                height: 60.0,
              ),
              //what I do?, Third section
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 const SansBold("What I do", 40.0), const  AnimatedCard(
                    imagepath: "assets/webL.png",
                    text: "Web Development",
                    width: 300.0,
                  ),
                  const  SizedBox(height: 35.0),
                  const AnimatedCard(
                    imagepath: "assets/app.png",
                    text: "App Development",
                    width: 300.0,
                    fit: BoxFit.contain,
                    reverse: true,
                  ),
                  const SizedBox(height: 35.0),
                  const AnimatedCard(
                    imagepath: "assets/firebase.png",
                    text: "Backend Development",
                    width: 300.0,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  //Contact, Fourth sectoin
                  const Wrap(
                    runSpacing: 20.0,
                    spacing: 20.0,
                    alignment: WrapAlignment.center,
                    children: [
                      const SizedBox(height: 30),
                      ContactFormMobile(),
                      const SizedBox(height:20)
                    ],
                  ),

                ],
              ),
            ],
          )),
    );
  }
}
