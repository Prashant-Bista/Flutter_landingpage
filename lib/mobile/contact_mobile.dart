import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components.dart';

class ContactMobile extends StatefulWidget {
  const ContactMobile({super.key});

  @override
  State<ContactMobile> createState() => _ContactMobileState();
}

class _ContactMobileState extends State<ContactMobile> {
  @override
  Widget build(BuildContext context) {
    double widthdevice= MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      endDrawer: DrawersMobile(),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 400.0 ,
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(size: 35.0, color: Colors.black),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset("assets/contact_image.jpg",fit: BoxFit.cover,),
              ),
            )
          ];
        },
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 25.0),
          child: Wrap(
            spacing: 20.0,
            runSpacing: 20.0,
            alignment: WrapAlignment.center,
            children:[Column(children:[
              SansBold("Contact_me", 35.0),
              SizedBox(height: 20.0,),
              TextForm(hintText: "Please type your First Name", text: "First Name", Containerwidth: widthdevice/1.4
              ),
              TextForm(hintText: "Please type your Last Name", text: "Last Name", Containerwidth: widthdevice/1.4
              ),
              TextForm(hintText: "Please type your contact number", text: "Phone Number", Containerwidth: widthdevice/1.4
              ),
              TextForm(hintText: "Please type your Email Address", text: "Email", Containerwidth: widthdevice/1.4
              ),
              TextForm(hintText: "Please type your Message", text: "Message", Containerwidth: widthdevice/1.4,maxlines: 10,
              ),
              MaterialButton(onPressed: (){},
                elevation: 20.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular((5)),

                ),
                height: 60,
                  minWidth: widthdevice/2.2,
                color: Colors.lightBlueAccent,
                child: SansBold("Submit",20.0),
              )

            ],
          ),
       ] ),
      ),
    ));
  }
}
