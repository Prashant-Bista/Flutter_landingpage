//Since we are going to modify the widget of the title property a lot more.
// It would be best to move the widget from the title property and collect it from the components file.
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

var logger = Logger();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _firstController = TextEditingController();
final TextEditingController _lastController = TextEditingController();
final TextEditingController _phoneController = TextEditingController();
final TextEditingController _messageController = TextEditingController();
urlLauncher(String imagePath,String url){
  return IconButton(onPressed: () async {
    await launchUrl(Uri.parse(url));
  }, icon: SvgPicture.asset(imagePath,height: 20,width: 20,));
}
class ContactFormMobile extends StatefulWidget {
  const ContactFormMobile({super.key});

  @override
  State<ContactFormMobile> createState() => _ContactFormMobileState();
}

class _ContactFormMobileState extends State<ContactFormMobile> {

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double widthdevice = MediaQuery.of(context).size.width;

    return  Form(
      key: formKey,
      child: Column(
        children: [
          SansBold("Contact Me", 35.0),
          SizedBox(
            height: 20.0,
          ),
          TextForm(
              controller: _firstController,
              hintText: "Please type your First Name",
              text: "First Name",
              Containerwidth: widthdevice / 1.4,
              validator: (text){
                if (text.toString().length==0){
                  return "First Name is required";
                }}),
          TextForm(
              controller: _lastController,
              hintText: "Please type your Last Name",
              text: "Last Name",
              Containerwidth: widthdevice / 1.4),
          TextForm(
            controller: _phoneController,
            hintText: "Please type your contact number",
            text: "Phone Number",
            Containerwidth: widthdevice / 1.4,
          ),
          TextForm(
              controller: _emailController,
              hintText: "Please type your Email Address",
              text: "Email",
              Containerwidth: widthdevice / 1.4,
              validator: (text){
                if (text.toString().length==0){
                  return "Email is required";
                }}
          ),

          TextForm(
            controller: _messageController,
            hintText: "Please type your Message",
            text: "Message",
            Containerwidth: widthdevice / 1.4,
            maxlines: 10,
            validator: (text){
              if (text.toString().length==0){
                return "Message is required";
              }
            },
          ),
          SizedBox(height:20),
          MaterialButton(
            onPressed: () async {
              logger.d(_firstController.text);
              var addData = new AddDataFirestore();
              if (formKey.currentState!.validate()) {
                if (await addData.addResponse(
                    _firstController.text, _lastController.text,
                    _emailController.text, _phoneController.text,
                    _messageController.text)) {
                  formKey.currentState!.reset();
                  DialogError(context, "Message Sent Successfully");
                }
                else{
                  DialogError(context, "Message Failed to send");
                }

              }
            },
            elevation: 20.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular((5)),
            ),
            height: 60,
            minWidth: widthdevice / 2.2,
            color: Colors.lightBlueAccent,
            child: SansBold("Submit", 20.0),
          ),
          SizedBox(height: 20,)
        ],
      ),
    );
  }
}


class ContactFormWeb extends StatefulWidget {
  const ContactFormWeb({super.key});

  @override
  State<ContactFormWeb> createState() => _ContactFormWebState();
}

class _ContactFormWebState extends State<ContactFormWeb> {
  final formKey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var heightdevice = MediaQuery.of(context).size.height;
    var widthdevice = MediaQuery.of(context).size.width;
    return Form(
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
                    controller: _firstController,
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
                    controller: _lastController,
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
          SizedBox(height: 100.0,),
          TextForm(
            controller: _messageController,
            hintText: "Please type your message",
            text: "Message",
            Containerwidth: widthdevice / 1.5,
            maxlines: 10,
          ),
          MaterialButton(
            onPressed: ()async {
              logger.d(_firstController.text);
              final addData= new AddDataFirestore();
              if (formKey.currentState!.validate()){
                if (await addData.addResponse(_firstController.text, _lastController.text, _emailController.text, _phoneController.text, _messageController.text)){
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
    );
  }
}

class DrawersMobile extends StatelessWidget {
  const DrawersMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DrawerHeader(
              padding: EdgeInsets.only(bottom: 20),
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 2.0, color: Colors.black)),
                child: Image.asset('assets/PP-circle.png'),
              )),
          TabsMobile(text: "Home", route: "/"),
          SizedBox(
            height: 20,
          ),
          TabsMobile(text: "About", route: '/about'),
          SizedBox(
            height: 20,
          ),
          TabsMobile(text: "Works", route: '/works'),
          SizedBox(
            height: 20,
          ),
          TabsMobile(text: "Blog", route: '/blog'),
          SizedBox(
            height: 20,
          ),
          TabsMobile(text: "Contact", route: '/contact'),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              urlLauncher("assets/instagram.svg", "https://www.instagram.com/prashantbista7/"),
              urlLauncher("assets/github.svg", "https://github.com/Prashant-Bista"),
              IconButton(onPressed: () async {
                await launchUrl(Uri.parse("https://www.linkedin.com/in/prashant-bista-9016b5270/"));
              }, icon: Image.asset("assets/linkedin.png",height: 20,width: 20,))
            ],
          )
        ],
      ),
    );
  }
}



class DrawersWeb extends StatelessWidget {
  const DrawersWeb({super.key});

  @override
  Widget build(BuildContext context) {
    urlLauncher(String imagePath,String url){
      return IconButton(onPressed: () async {
        await launchUrl(Uri.parse(url));
      }, icon: SvgPicture.asset(imagePath,height: 20,width: 20,));
    }
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 72.0,
            backgroundColor: Colors.lightBlueAccent,
            child: CircleAvatar(
              radius: 70.0,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/PP-circle.png"),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          SansBold("Prashant Bista", 30.0),
          SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              urlLauncher("assets/instagram.svg", "https://www.instagram.com/prashantbista7/"),
              urlLauncher("assets/github.svg", "https://github.com/Prashant-Bista"),
              IconButton(onPressed: () async {
                await launchUrl(Uri.parse("https://www.linkedin.com/in/prashant-bista-9016b5270/"));
              }, icon: Image.asset("assets/linkedin.png",height: 20,width: 20,))
            ],
          )
        ],
      ),
    );
  }
}

class TabseWebList extends StatefulWidget {
  const TabseWebList({super.key});

  @override
  State<TabseWebList> createState() => _TabseWebListState();
}

class _TabseWebListState extends State<TabseWebList> {
  @override
  Widget build(BuildContext context) {
    return Row(
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
          route: '/works',
        ),
        Spacer(),
        TabsWeb(
          title: "Blog",
          route: '/blog',
        ),
        Spacer(),
        TabsWeb(
          title: "About",
          route: '/about',
        ),
        Spacer(),
        TabsWeb(
          title: "Contact",
          route: '/',
        ),
        Spacer(),
      ],
    );
  }
}

class AddDataFirestore {
  CollectionReference response =
      FirebaseFirestore.instance.collection('messages');
  Future addResponse(final firstName, final lastName, final email,
      final phoneNumber, final message) {
    return response.add({
      'first name': firstName,
      'last name': lastName,
      'email': email,
      'phone number': phoneNumber,
      'message': message,
    }).then((value) {
      logger.d("Succenss");
      return true;
    }).catchError((error) {
      logger.d(error);
      return false;
    });
  }
}

class AbelCustom extends StatelessWidget {
  final text;
  final size;
  final color;
  final fontWeight;
  const AbelCustom(
      {super.key,
      @required this.text,
      @required this.size,
      @required this.color,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.abel(
        fontSize: size,
        color: color == null ? Colors.black : color,
        fontWeight: fontWeight == null ? FontWeight.normal : fontWeight,
      ),
    );
  }
}

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
  final controller;
  final validator;
  const TextForm(
      {super.key,
      @required this.hintText,
      @required this.text,
      @required this.Containerwidth,
      this.maxlines,
      this.controller,
      this.validator});

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
            validator: validator,
            controller: controller,
            maxLines: maxlines == null ? null : maxlines,
            decoration: InputDecoration(
              focusedErrorBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.pink, style: BorderStyle.solid),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.red, style: BorderStyle.solid),
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
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
          ),
        ),
      ],
    );
  }
}

class AnimatedCard extends StatefulWidget {
  final imagepath;
  final text;
  final fit;
  final reverse;
  final height;
  final width;
  const AnimatedCard({
    super.key,
    @required this.imagepath,
    this.text,
    this.fit,
    this.reverse,
    this.height,
    this.width,
  });

  @override
  State<AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard>
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
              widget.text == null ? SizedBox() : SansBold(widget.text, 15.0),
            ],
          ),
        ),
      ),
    );
  }
}

Future DialogError(BuildContext context,String title) {
  return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: SansBold(title, 20.0),
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.lightBlueAccent),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ));
}
