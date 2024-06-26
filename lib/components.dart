//Since we are going to modify the widget of the title property a lot more.
// It would be best to move the widget from the title property and collect it from the components file.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                  shadows: [Shadow(color: Colors.black, offset: Offset(0, -8))],
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

class SansBold extends StatelessWidget {
  final text;
  final size;

  const SansBold(this.text, this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(fontSize: size, fontWeight: FontWeight.bold),
    );
  }
}

class Sans extends StatelessWidget {
  final text;
  final size;

  const Sans(this.text, this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: GoogleFonts.openSans(fontSize: size));
  }
}

class TextForm extends StatelessWidget {
  final heading;
  final hintText;
  final width;
  final maxlines;
  const TextForm({super.key,@required this.hintText,@required this.heading, @required this.width, this.maxlines});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Sans((heading), 16.0),
        SizedBox(
          height: 5.0,
        ),
        SizedBox(
          width: 350,
          child: TextFormField(
            maxLines: maxlines==null?null:maxlines,
            decoration: InputDecoration(
              focusedErrorBorder:OutlineInputBorder(
                borderSide:
                BorderSide(color: Colors.red, style: BorderStyle.solid),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ) ,
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.lightBlue, style: BorderStyle.solid),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              hintText: hintText,
              hintStyle: GoogleFonts.poppins(fontSize: 14.0),
            ),
            validator: (text){
              if (RegExp("\\bprashant\\b",caseSensitive: false).hasMatch(text.toString())){
                return "Match found";
              }
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
        ),
      ],
    );
  }
}
