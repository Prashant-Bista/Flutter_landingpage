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
    var heightdevice = MediaQuery.of(context).size.height;
    var widthdevice = MediaQuery.of(context).size.width;
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
        //first section
        Container(
          height: heightdevice - 56,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    //
                    decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        )),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: SansBold("Hello, I'm", 20.0),
                  ),
                  SizedBox(height: 15),
                  SansBold("Prashant Bista", 55.0),
                  Sans("Learning Flutter", 22.0),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      Icon(Icons.email),
                      SizedBox(
                        width: 20,
                      ),
                      Sans("bistaprashant@gmail.com", 15.0)
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.phone),
                      SizedBox(
                        width: 20,
                      ),
                      Sans("9812345678", 15.0)
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_pin),
                      SizedBox(
                        width: 20,
                      ),
                      Sans("221B, Baker Street, UK", 15.0)
                    ],
                  )
                ],
              ),
              //multiple circleAvatars of slightly different sizes to
              //create a border of different colors
              CircleAvatar(
                backgroundColor: Colors.black,
                radius: 139,
                child: CircleAvatar(
                  radius: 137,
                  backgroundColor: Colors.lightBlueAccent,
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
        //starting the beginning of the second page
        Container(
          height: heightdevice / 1.5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("assets/web.jpg"),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SansBold("About Me", 40.0),
                  SizedBox(
                    height: 15.0,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Sans(
                      "Hello, I'm Prashant Bista. I speacialize in flutter UI Development.",
                      15.0),
                  SizedBox(
                    height: 15,
                  ),
                  Sans(
                      "I don't plan to stay a frontend developer only. Soon, there will be more from me.",
                      15.0),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.lightBlueAccent,
                            style: BorderStyle.solid,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Sans("Flutter", 15.0),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.lightBlueAccent,
                            style: BorderStyle.solid,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Sans("Firebase", 15.0),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.lightBlueAccent,
                            style: BorderStyle.solid,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Sans("Android", 15.0),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.lightBlueAccent,
                            style: BorderStyle.solid,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Sans("IOS", 15.0),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.lightBlueAccent,
                            style: BorderStyle.solid,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Sans("Linux", 15.0),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        //Third section of the page
        Container(
          height: heightdevice / 1.3,
          child: Column(
            children: [
              SansBold("What I do?", 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    elevation: 30,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    shadowColor: Colors.lightBlueAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset("assets/webL.png",
                              height: 200.0, width: 200.0),
                          SizedBox(
                            height: 10,
                          ),
                          SansBold("Web Development", 15.0)
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 30,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    shadowColor: Colors.lightBlueAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset("assets/app.png",
                              height: 200.0, width: 200.0, fit: BoxFit.contain),
                          SizedBox(
                            height: 10,
                          ),
                          SansBold("App Development", 15.0)
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 30,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    shadowColor: Colors.lightBlueAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset("assets/firebase.png",
                              height: 200.0, width: 200.0),
                          SizedBox(
                            height: 10,
                          ),
                          SansBold("Back-End Development", 15.0)
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        //Forth Section
        Container(
          height: heightdevice,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SansBold("Contact Me", 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      TextForm(
                        hintText: "Enter the first name",
                        heading: "First Name",
                        width: 350,
                      ),
                      SizedBox(height: 15),
                      TextForm(
                          hintText: "Please enter your Email Address",
                          heading: "Email",
                          width: 350),
                    ],
                  ),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextForm(
                          hintText: "Please Enter your Last Name",
                          heading: "Last Name",
                          width: 350),
                      SizedBox(height: 15.0),
                      TextForm(
                          hintText: ("Please Enter your phone number "),
                          heading: "Phone Number",
                          width: 350)
                    ],
                  )
                ],
              ),
              TextForm(
                hintText: "Please type your message",
                heading: "Message",
                width: widthdevice / 1.5,
                maxlines: 10,
              )
            ],
          ),
        )
      ]),
    );
  }
}
