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
      drawer: DrawersWeb(),
      backgroundColor: Colors.white,
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                title: TabseWebList(),
                expandedHeight: 600.0,
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(
                  size: 25.0,
                  color: Colors.black,
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    "assets/contact_image.jpg",
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
            ];
          },
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 30.0,
                ),
                SansBold("Contact me", 40.0),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        TextForm(
                            hintText: "Please Enter your Firstname",
                            text: "First Name",
                            Containerwidth: 350.0),
                        SizedBox(
                          height: 25.0,
                        ),
                        TextForm(
                            hintText: "Please Enter your Email address",
                            text: "Email",
                            Containerwidth: 350.0)
                      ],
                    ),
                    Column(
                      children: [
                        TextForm(
                            hintText: "Please Enter your Last Name",
                            text: "Last Name",
                            Containerwidth: 350.0),
                        SizedBox(
                          height: 25.0,
                        ),
                        TextForm(
                            hintText: "Please Enter your Phone Number",
                            text: "Phone NUmber",
                            Containerwidth: 350.0)
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextForm(
                  hintText: ("Please Enter your Message"),
                  text: "Message",
                  Containerwidth: widthDevice / 1.5,
                  maxlines: 10,
                ),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  child: Sans("Submit", 20.0),
                  onPressed: () {},
                  elevation: 20.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Colors.lightBlueAccent,
                  height: 60.0,
                  minWidth: 200.0,
                )
              ],
            ),
          )),
    );
  }
}
