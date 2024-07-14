//Since we are going to modify the widget of the title property a lot more.
// It would be best to move the widget from the title property and collect it from the components file.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class TabsWeb extends StatefulWidget {
  final title;
  final route;
  const TabsWeb({super.key, this.title, this.route});

  @override
  State<TabsWeb> createState() => _TabsWebState();
}

class _TabsWebState extends State<TabsWeb> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(widget.route);
      },
      child: MouseRegion(
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
            duration: const Duration(milliseconds: 75),
            curve: Curves.easeInExpo,
            style: isSelected
                ? GoogleFonts.roboto(
                    fontSize: 25,
                    color: Colors.transparent,
                    shadows: [
                      Shadow(color: Colors.black, offset: Offset(0, -8))
                    ],
                    decoration: TextDecoration.underline,
                    decorationThickness: 1,
                    decorationColor: Colors.lightBlueAccent)
                : GoogleFonts.roboto(color: Colors.black, fontSize: 20.0),
            child: Text(
              widget.title,
            ),
          )),
    );
  }
}

class TabsMobile extends StatefulWidget {
  final text;
  final route;
  const TabsMobile({super.key, @required this.text, @required this.route});

  @override
  State<TabsMobile> createState() => _TabsMobileState();
}

class _TabsMobileState extends State<TabsMobile> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.of(context).pushNamed(widget.route);
      },
      color: Colors.black,
      elevation: 20.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      height: 50.0,
      minWidth: 200.0,
      child: Text(
        widget.text,
        style: GoogleFonts.openSans(fontSize: 20.0, color: Colors.white),
      ),
    );
  }
}

class BlueContainer extends StatelessWidget {
  final text;
  const BlueContainer({super.key, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.lightBlueAccent,
            style: BorderStyle.solid,
            width: 2.0),
        borderRadius: BorderRadius.circular(5.0),
      ),
      padding: EdgeInsets.all(7.0),
      child: Text(
        text,
        style: GoogleFonts.openSans(
          fontSize: 15.0,
        ),
      ),
    );
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
  final text;
  final hintText;
  final Containerwidth;
  final maxlines;
  const TextForm(
      {super.key,
      @required this.hintText,
      @required this.text,
      @required this.Containerwidth,
      this.maxlines});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Sans((text), 16.0),
        SizedBox(
          height: 5.0,
        ),
        SizedBox(
          width: 350,
          child: TextFormField(
            maxLines: maxlines == null ? null : maxlines,
            decoration: InputDecoration(
              focusedErrorBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.red, style: BorderStyle.solid),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.lightBlue, style: BorderStyle.solid),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              hintText: hintText,
              hintStyle: GoogleFonts.poppins(fontSize: 14.0),
            ),
            validator: (text) {
              if (RegExp("\\bprashant\\b", caseSensitive: false)
                  .hasMatch(text.toString())) {
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

class AnimatedCardWeb extends StatefulWidget {
  final imagepath;
  final text;
  final fit;
  final reverse;
  final height;
  final width;
  const AnimatedCardWeb({
    super.key,
    @required this.imagepath,
    @required this.text,
    this.fit,
    this.reverse,
    this.height,
    this.width,
  });

  @override
  State<AnimatedCardWeb> createState() => _AnimatedCardWebState();
}

class _AnimatedCardWebState extends State<AnimatedCardWeb>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 4))
        ..repeat(reverse: true);
//choose offset as the type of the animation
  late Animation<Offset> _animation = Tween(
          //Since our animated cards are going to move in two directions, we need to write that whenever the widget
          // dot reverse is true, then the starting position of the card widget will be offset zero comma 0.08 and
          begin: widget.reverse == true ? Offset(0, 0.08) : Offset.zero,
          end: widget.reverse == true ? Offset.zero : Offset(0, 0.08)
          //This way the properties got attached to the controller.
          )
      .animate(_controller);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Card(
        elevation: 30.0,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.lightBlueAccent),
            borderRadius: BorderRadius.circular(15.0)),
        shadowColor: Colors.lightBlueAccent,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(widget.imagepath,
                  height: widget.height == null ? 200.0 : widget.height,
                  width: widget.width == null ? 200.0 : widget.width,
                  fit: widget.fit == null ? null : widget.fit),
              SizedBox(
                height: 10.0,
              ),
              SansBold(widget.text, 15.0),
            ],
          ),
        ),
      ),
    );
  }
}
