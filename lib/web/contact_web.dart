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
            child: ContactFormWeb(),
          )),
    );
  }
}
