//Since we are going to modify the widget of the title property a lot more.
// It would be best to move the widget from the title property and collect it from the components file.
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabsWeb extends StatefulWidget {
  final title;
  const TabsWeb(this.title, {super.key});

  @override
  State<TabsWeb> createState() => _TabsWebState();
}

class _TabsWebState extends State<TabsWeb> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onEnter: (_) {
          setState(() {
            isSelected = true;
          });
        },
        onExit: (_) {
          setState(() {
            isSelected = false;
          });
        },
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeInExpo,
          style: isSelected
              ? GoogleFonts.maitree(
                  fontSize: 25,
                  color: Colors.transparent,
                  shadows: [Shadow(color: Colors.black,offset: Offset(0,-8))],
                  decoration: TextDecoration.underline,
                  decorationThickness: 1,
                  decorationColor: Colors.black)
              : GoogleFonts.maitree(color: Colors.black, fontSize: 23),
          child: Text(
            widget.title,

          ),
        ));
  }
}
