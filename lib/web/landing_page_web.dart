import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prashant_bista/components.dart';

class LandingPageWeb extends StatefulWidget {
  const LandingPageWeb({super.key});

  @override
  State<LandingPageWeb> createState() => _LandingaPageMobileState();
}

class _LandingaPageMobileState extends State<LandingPageWeb> {
  @override
  Widget build(BuildContext context) {
    double heightdevice = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: Drawer(//To create a drawer menu

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
            TabsWeb("Home"),
            Spacer(),
            TabsWeb("Works"),
            Spacer(),
            TabsWeb("Blogs"),
            Spacer(),
            TabsWeb("About"),
            Spacer(),
            TabsWeb("Contact"),
            Spacer(),
          ],
        ),
      ),
      body: ListView(children: [
        Container(
          height: heightdevice - 56,
          child: Row(
            mainAxisAlignment:MainAxisAlignment.spaceAround ,
            children: [
              Column(
                mainAxisAlignment:MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.tealAccent,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight:Radius.circular(25),
                        bottomRight:Radius.circular(25),
                      )
                    ),padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                      child: Text(
                    "Hello, I'm",
                    style: GoogleFonts.openSans(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ))
                ],
              ),
              CircleAvatar(
                backgroundColor: Colors.black,
                radius: 139,
                child: CircleAvatar(
                  radius: 137,
                  backgroundColor: Colors.tealAccent,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage("assets/PP-circle.png"),
                    radius: 135,
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
