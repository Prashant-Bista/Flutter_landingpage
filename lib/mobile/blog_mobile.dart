import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components.dart';

class BlogMobile extends StatefulWidget {
  const BlogMobile({super.key});

  @override
  State<BlogMobile> createState() => _BlogMobileState();
}

class _BlogMobileState extends State<BlogMobile> {
  List title= ["Maharaja recieves positive reviews from all the critics.","Winners of the Global Gamers Challenge"];
  List body=["Look for the article in times of india.","Look for the article in Medium website"];
  void article() async {
    await FirebaseFirestore.instance
        .collection("articles")
        .get()
        .then((querySnapshot) {
      querySnapshot.docs
        ..forEach((element) {
          //print(element.data()['title']);
        });
    });
  }

  void streamArticle() async {
    await for (var snapshot
        in FirebaseFirestore.instance.collection(('articles')).snapshots()) {
      for (var title in snapshot.docs){
        print(title.data()['title']);
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    streamArticle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 400,
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
                          borderRadius: BorderRadius.circular((3.0))),
                      padding: EdgeInsets.symmetric(horizontal: 4.0),
                      child: AbelCustom(
                        text: "Welcome to my blog",
                        size: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    background: Image.asset(
                      "assets/blog.jpg",
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ];
            },
            body: StreamBuilder<QuerySnapshot>(
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


            ),)
    );
  }
}

class BlogPosts extends StatefulWidget {
  final title;
  final body;
  const BlogPosts({super.key,@required this.title,@required this.body});

  @override
  State<BlogPosts> createState() => _BlogPostsState();
}

class _BlogPostsState extends State<BlogPosts> {
  bool expand = false;
  @override
  Widget build(BuildContext context) {
    double widthdevice = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 50.0),
      child: Container(
        width: 200,
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            border: Border.all(
                style: BorderStyle.solid, width: 1.0, color: Colors.black)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              alignment: WrapAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 2.0),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                  child: AbelCustom(
                    text:widget.title.toString(),
                    size: widthdevice / 28.0,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        expand = !expand;
                      });
                    },
                    icon: Icon(
                      Icons.arrow_drop_down_circle,
                      color: Colors.black,
                    ))
              ],
            ),
            SizedBox(height: 7.0),
            Text(
              widget.body.toString(),
              style: GoogleFonts.openSans(fontSize: 13.0),
              maxLines: expand == true ? null : 3,
              overflow:
                  expand == true ? TextOverflow.visible : TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
