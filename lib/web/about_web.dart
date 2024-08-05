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
      drawer: DrawersWeb(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        //Extra elevation creates a bad separation between
        //appbar and rest of the body
        iconTheme: IconThemeData(size: 25.0, color: Colors.orange),
        title: TabseWebList(),
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
                  SansBold("About Me", 40.0),
                  SizedBox(height: 40.0,),
                  Sans("Hello! I'm Prashant Bista. I Specialize in Flutter front-end development.", 15.0),
                  Sans("I do not plan to stay a front end developer. Soon there will be more from me", 15.0),
                  SizedBox(height:10.0 ,),
                 Row(
                   children: [
                     BlueContainer(text: "Flutter"),
                     SizedBox(width: 7.0,),
                     BlueContainer(text: "Firebase"),
                     SizedBox(width: 7.0,),
                     BlueContainer(text: "Android"),
                     SizedBox(width: 7.0,),
                     BlueContainer(text: "IOS"),
                     SizedBox(width: 7.0,),
                     BlueContainer(text: "Web"),
                     SizedBox(width: 7.0,),
                     BlueContainer(text: "Windows"),
                   ],
                 )


                ],
              ),
              CircleAvatar(
                radius: 117.0,
                backgroundColor: Colors.lightBlueAccent,
                child: CircleAvatar(
                  radius: 114.0,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    radius: 112.0,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage("assets/PP-circle.png"),
                  ),
                ),
              ),
            ],

          ) 
            ,),
          //2nd section, web development
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedCard(imagepath: "assets/webL.png",height: 250.0,width:250.0,),
              SizedBox(
                width: widthdevice/3,
                child: Column(
                  children: [
                    SansBold("Web development", 30.0),
                    SizedBox(height: 50.0,),
                    Sans("I'm here to help you go online with web apps.",15.0),

                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: widthdevice/3,
                child: Column(
                  children: [
                    SansBold("App development", 30.0),
                    SizedBox(height: 50.0,),
                    Sans("I got you covered in case you need a beautiful responsive and a hight performance app,",15.0),

                  ],
                ),
              ),
              AnimatedCard(imagepath: "assets/app.png",height: 250.0,width:250.0,reverse: true,),
            ],
          ),
          SizedBox(height: 20.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedCard(imagepath: "assets/firebase.png",height: 250.0,width:250.0,),
              SizedBox(
                width: widthdevice/3,
                child: Column(
                  children: [
                    SansBold("Back-end development", 30.0),
                    SizedBox(height: 50.0,),
                    Sans("I can make you highly scalable and secure back-end.",15.0),

                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 40.0,),
          //third section


          
        ],

      ),
    );
  }

}
