//Since we are going to modify the widget of the title property a lot more.
// It would be best to move the widget from the title property and collect it from the components file.
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class TabsWeb extends StatefulWidget {
  final title;
  const TabsWeb(this.title,{super.key});

  @override
  State<TabsWeb> createState() => _TabsWebState();
}

class _TabsWebState extends State<TabsWeb> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.title,style: GoogleFonts.fahkwang(color: Colors.black,fontSize: 20),);
  }
}
