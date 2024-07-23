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
          body:ListView(
            children: [
              BlogPosts(),
              BlogPosts(),
              BlogPosts(),
              BlogPosts(),


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
          ),
            SizedBox(height:7.0),
            Text("In this Nithilan Swaminathan directorial, a man named Maharaja (Vijay Sethupathi) files a police complaint because the 'Lakshmi' in his house goes missing. When he goes to the police station to file a complaint, there's a thief in custody who is named Police. Maharaja, the film, is full of such droll contradictions.To put it matter-of-factly, this is a film that revolves around the lives of two fathers. One is played by Vijay Sethupathi, and the other by Anurag Kashyap. The former lost his wife (Divya Bharathi) while his daughter Jothi was still a toddler. Meanwhile, the latter lives happily with his wife (Abhirami) and a daughter.Maharaja could have been a very straightforward or ‘we know what's in store’ film for the audience if it was plain sailing. But the manner in which the story has been told has unquestionably made all the difference. Throughout its runtime, there are multiple faulty and disoriented moments. But to give credit where it is due, the film manages to be engaging throughout. Maharaja is one of those films that keeps you invested. You feel so not because everything that plays out on screen is pronounced, but because the makers have been successful in generating anticipation as to what happens next.ith that said, there are many instances in the film that feel rather engineered or contrived. This sentiment is particularly true for one comic moment in the film where Maharaja narrates how Lakshmi went missing. The fact that who/what Lakshmi is is supposed to make us laugh, and it is indeed laughable that this man has approached the police just because of who/what went missing. But the makers overstretch the reactions of those hearing his story. Yes, the situation is funny, but why make it so in your face that makes us feel as if too much is being done.Right from the first look of the film, the makers have made it clear that this is going to be a violent film. With its lead named Maharaja, you would expect that you were in for a mass outing right from the start. But, rather excitingly, the film starts with a fun game of Antakshari, and initially, Vijay Sethupathi is not presented as an out-and-out hero or as someone to fear. First, we see him working in a saloon and asking for leave from his employer. The very next time we see him, he is in a shop, selecting toys from a fancy store.A point of contention as far as this film is concerned is the way it has chosen to portray violence, specifically violence against women. In many of our films, violence is used more as a varnishing tool, even if the story doesn't require it. A contentious aspect of Maharaja is the way it has used violence against women as a tool to show how terrible the bad guys are. For instance, there are many ways to show characters in a film in a negative light. One obvious trait for us to hate a character is if that person is physically abusive towards women. In this film, that angle comes across as if it is used only as a tool to showcase how bad the antagonists are. On the other hand, they could have treated the issue with more sensitivity.What Maharaja also gets wrong is the characterisation of its antagonists, including Anurag Kashyap. Just having a big name as an actor in your film doesn't guarantee that the audience will connect with the character they are playing. The role has to be fleshed out, and that's what's missing from this film. We are told and shown that the antagonists are ruthless and terrible human beings. But the film does a bad job of fleshing out their characters. But the casting of Anurag Kashyap for this role makes sense, as the makers would have wanted to have an actor who has the presence to hold their own against Vijay Sethupathi as the antagonist. But neither the character nor the acting register after a point. As long as the focus is on Maharaja and the police officers investigating his complaint, the film manages to be smooth sailing. Sadly, things start to fluctuate as the focus shifts to the antagonists.Vijay Sethupathi is wonderful in his 50th film, and he has a well-written role at his disposal. The makers have definitely put in extra effort in conceptualising his character, as almost all the actions that he does and almost all the dialogues that he says have a payoff. And, the actor delivers. But this care for detail isn't given to the characters played by the other popular actors. Abhirami, Mamta Mohandas, Bharathirajaa and Divyabharathi seem to just be there because the makers wanted to rope in known names and not because their presence made any difference to the character or the plot.",
              style: GoogleFonts.openSans(fontSize: 15.0),maxLines: expand==true?null:3,
              overflow: expand==true?TextOverflow.visible:TextOverflow.ellipsis,)
          ],
        ),
      ),);

  }
}