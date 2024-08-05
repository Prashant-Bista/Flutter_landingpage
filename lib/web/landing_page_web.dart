import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:prashant_bista/components.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPageWeb extends StatefulWidget {
  const LandingPageWeb({super.key});

  @override
  State<LandingPageWeb> createState() => _LandingaPageWebState();
}

class _LandingaPageWebState extends State<LandingPageWeb> {
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
  var logger=Logger();
  final TextEditingController _firstNameController=TextEditingController();
  final TextEditingController _lastNameController=TextEditingController();
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _phoneController=TextEditingController();
  final TextEditingController _messageController=TextEditingController();
  final formKey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var heightdevice = MediaQuery.of(context).size.height;
    var widthdevice = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Drawer(),
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
              route: "/blog",
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
                          topLeft: Radius.circular(25.0),
                          topRight: Radius.circular(25.0),
                          bottomRight: Radius.circular(25.0),
                        )),
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
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
                        width: 20.0,
                      ),
                      Sans("bistaprashant@gmail.com", 15.0)
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.phone),
                      SizedBox(
                        width: 20.0,
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
                radius: 139.0,
                child: CircleAvatar(
                  radius: 137.0,
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
              Image.asset(
                "assets/web.jpg",
                height: widthdevice / 1.9,
              ),
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
                    height: 15.0,
                  ),
                  Sans(
                      "I don't plan to stay a frontend developer. Soon, there will be more from me.",
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
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        child: Sans("Flutter", 15.0),
                      ),
                      SizedBox(
                        width: 7.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.lightBlueAccent,
                            style: BorderStyle.solid,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(7.0),
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
                        width: 7.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.lightBlueAccent,
                            style: BorderStyle.solid,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(7.0),
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
                          borderRadius: BorderRadius.circular(7.0),
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
                  AnimatedCard(
                    imagepath: "assets/webL.png",
                    text: "Web Development",
                    fit: BoxFit.contain,
                    reverse: true,
                  ),
                  AnimatedCard(
                      imagepath: "assets/app.png", text: "App Development"),
                  AnimatedCard(
                    imagepath: "assets/firebase.png",
                    text: "Back-End Development",
                    reverse: true,
                  ),
                ],
              )
            ],
          ),
        ),
        //Forth Section
        Container(
          height: heightdevice,
          child: Form(
            key: formKey,
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
                          controller: _firstNameController,
                          hintText: "Enter the first name",
                          text: "First Name",
                          Containerwidth: 350,
                          validator: (text){
                            if (text.toString().isEmpty){
                              return "First Name is required";
                            }
                          },
                        ),
                        SizedBox(height: 15),
                        TextForm(
                          controller: _emailController,
                            hintText: "Please enter your Email Address",
                            text: "Email",
                            Containerwidth: 350,
                          validator: (text){
                            if (text.toString().isEmpty){
                              return "Email is required";
                            }
                          },),
                      ],
                    ),
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextForm(
                          controller: _lastNameController,
                            hintText: "Please Enter your Last Name",
                            text: "Last Name",
                            Containerwidth: 350,
                          validator: (text){
                            if (text.toString().isEmpty){
                              return "Message is required";
                            }
                          },),
                        SizedBox(height: 15.0),
                        TextForm(
                          controller: _phoneController,
                            hintText: ("Please Enter your phone number "),
                            text: "Phone Number",
                            Containerwidth: 350)
                      ],
                    )
                  ],
                ),
                TextForm(
                  controller: _messageController,
                  hintText: "Please type your message",
                  text: "Message",
                  Containerwidth: widthdevice / 1.5,
                  maxlines: 10,
                ),
                MaterialButton(
                  onPressed: ()async {
                    logger.d(_firstNameController.text);
                    final addData= new AddDataFirestore();
                   if (formKey.currentState!.validate()){
                     if (await addData.addResponse(_firstNameController.text, _lastNameController.text, _emailController.text, _phoneController.text, _messageController.text)){
                       formKey.currentState!.reset();
                       DialogError(context,"Message sent successfully");
                     }
                     else DialogError(context,"Message failed to send");
                   }
                  },
                  elevation: 20.0,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.lightBlueAccent),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: 60.0,
                  minWidth: 200.0,
                  color: Colors.lightBlueAccent,
                  child: SansBold("Submit", 20.0),
                ),
                SizedBox(
                  height: 20.0,
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
