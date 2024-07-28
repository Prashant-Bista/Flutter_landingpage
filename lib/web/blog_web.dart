import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components.dart';
class BlogWeb extends StatefulWidget {
  const BlogWeb({super.key});

  @override
  State<BlogWeb> createState() => _BlogWebState();
}

class _BlogWebState extends State<BlogWeb> {
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
              title: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular((3.0))
                ),
                padding: EdgeInsets.symmetric(horizontal: 7.0),
                child: AbelCustom(
                  text: "Welcome to my blog",
                  size: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              background: Image.asset("assets/blog.jpg",filterQuality: FilterQuality.high,fit: BoxFit.cover,),
            ),
          )

        ];
      },
          body:StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection(('articles')).snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData){
                  return ListView.builder(itemCount: snapshot.data!.docs.length,itemBuilder: (BuildContext context,int index){
                    DocumentSnapshot documentSnapshot= snapshot.data!.docs[index];
                    return BlogPosts(title: documentSnapshot["title"], body: documentSnapshot["body"]);
                  });}
                else return Center(
                    child: CircularProgressIndicator());
              }
          )



          )
      ),
    );
  }
}
class BlogPosts extends StatefulWidget {
  final title;
  final body;
  const BlogPosts({super.key, @required this.title, @required this.body});

  @override
  State<BlogPosts> createState() => _BlogPostsState();
}

class _BlogPostsState extends State<BlogPosts> {
  bool expand=false;
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(left:70.0,right: 70.0,top: 40.0),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            border: Border.all(style: BorderStyle.solid,width: 1.0,color: Colors.black)
        ),
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
                text: widget.title,size:25.0 ,
                color: Colors.white,
              ),
            ),
              IconButton(onPressed: (){
                setState(() {
                  expand=!expand;
                });
              }, icon: Icon(Icons.arrow_drop_down_circle,color: Colors.black,))
            ],
          ),
            SizedBox(height:7.0),
            Text(widget.body,
              style: GoogleFonts.openSans(fontSize: 15.0),maxLines: expand==true?null:3,
              overflow: expand==true?TextOverflow.visible:TextOverflow.ellipsis,)
          ],
        ),
      ),);

  }
}