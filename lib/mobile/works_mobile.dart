import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components.dart';
class WorksMobile extends StatefulWidget {
  const WorksMobile({super.key});

  @override
  State<WorksMobile> createState() => _WorksMobileState();
}

class _WorksMobileState extends State<WorksMobile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
    extendBodyBehindAppBar: true,
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
    body: NestedScrollView(
    headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
    return <Widget>[
    SliverAppBar(
    expandedHeight: 400.0 ,
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(size: 35.0, color: Colors.black),
    flexibleSpace: FlexibleSpaceBar(
    background: Image.asset("assets/works.jpg",fit: BoxFit.cover,),
    ),
    )
    ];
    },
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.0,),
              SansBold("Works", 35.0),
              SizedBox(height: 20.0,),
              AnimatedCard(imagepath: "assets/portfolio.png",fit: BoxFit.contain,height: 150.0,width: 300.0,),
              SizedBox(height: 30.0,),
              SansBold("Portfolio", 20.0),
              SizedBox(height: 10.0,),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Sans("Deployed on Android,Ios and web ,the portfolio project was truly an achievement. I used Flutter framework for the UI and firebase for the backend tasks.",15.0),
              ),

            ],
          )
        ],
      ),
    )));
  }
}
