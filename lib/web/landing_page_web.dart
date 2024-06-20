import 'package:flutter/material.dart';
import 'package:prashant_bista/components.dart';
class LandingPageWeb extends StatefulWidget {
  const LandingPageWeb({super.key});

  @override
  State<LandingPageWeb> createState() => _LandingaPageMobileState();
}

class _LandingaPageMobileState extends State<LandingPageWeb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(//To create a drawer menu


      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation:  0.0,
        //Extra elevation creates a bad separation between
        //appbar and rest of the body
        iconTheme: IconThemeData(
          size: 25.0,
          color:Colors.orange
        ),
        title: Row(

          children: [
            Spacer(flex: 3,),
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
      body: CircleAvatar(
        radius: 103,
        backgroundColor: Colors.black,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: AssetImage("assets/PP-circle.png"),
          radius: 100,
        ),
      ),
    );
  }
}
