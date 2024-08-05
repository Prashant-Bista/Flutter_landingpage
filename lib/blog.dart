import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components.dart';
class Blog extends StatefulWidget {
  const Blog({super.key});

  @override
  State<Blog> createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  @override
  Widget build(BuildContext context) {
    late var drawer;
    bool isWeb = MediaQuery.of(context).size.width>800.0;
    return  SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          endDrawer:isWeb?DrawersWeb():DrawersMobile(),
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
                      centerTitle: isWeb?false:true,
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
    bool isWeb = MediaQuery.of(context).size.width>800.0;

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
                    size: isWeb?(widthdevice / 56.0):(widthdevice / 28.0),
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
              style: GoogleFonts.openSans(fontSize: isWeb?18.0:13.0),
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

