import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components.dart';
class BlogMobile extends StatefulWidget {
  const BlogMobile({super.key});

  @override
  State<BlogMobile> createState() => _BlogMobileState();
}

class _BlogMobileState extends State<BlogMobile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      extendBodyBehindAppBar: true,
      endDrawer: Drawer(
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
                IconButton(
                    onPressed: () async => await launchUrl(Uri.parse(
                        "https:://www.instagram.com/prashantbista7/")),
                    icon: SvgPicture.asset(
                      "assets/instagram.svg",
                      height: 25,
                      width: 25,
                    )),
                IconButton(
                    onPressed: () async => await launchUrl(
                        Uri.parse("https://github.com/Prashant-Bista")),
                    icon: SvgPicture.asset(
                      "assets/github.svg",
                      height: 25,
                      width: 25,
                    )),
                IconButton(
                    onPressed: () async => await launchUrl(Uri.parse(
                        "https://www.linkedin.com/in/prashant-bista-9016b5270/")),
                    icon: Image.asset(
                      "assets/linkedin.png",
                      height: 25,
                      width: 25,
                    ))
              ],
            )
          ],
        ),
      ),
      body: NestedScrollView(headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 500,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(
              size: 35.0,
              color: Colors.black,
            ),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular((3.0))
                ),
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: AbelCustom(
                  text: "Welcome to my blog",
                  size: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              background: Image.asset("assets/blog.jpg",filterQuality: FilterQuality.high,fit: BoxFit.cover,),
            ),
          )

        ];
      },
        body:ListView(
          children: [
            BlogPosts()
          ],
        )
      ),
    ));
  }
}
class BlogPosts extends StatefulWidget {
  const BlogPosts({super.key});

  @override
  State<BlogPosts> createState() => _BlogPostsState();
}

class _BlogPostsState extends State<BlogPosts> {
  bool expand=false;
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(left:20.0,right: 20.0,top: 50.0),
    child: Container(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Container(
          padding: EdgeInsets.symmetric(horizontal: 5.0),

          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(3.0),
          ),
          child: AbelCustom(
            text: "Maharaja recieves highly positive judgements from critics.",size:25.0 ,
            color: Colors.white,
          ),
        ),
          IconButton(onPressed: (){
            setState(() {
              expand=!expand;
            });
          }, icon: Icon(Icons.arrow_drop_down_circle,color: Colors.black,))
        ],
      )],
    ),
    ),);

  }
}

