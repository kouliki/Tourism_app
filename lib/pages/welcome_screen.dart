
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourism_app/pages/navpages/Home_Page.dart';
import 'package:tourism_app/widgets/app_large_text.dart';
import 'package:tourism_app/widgets/app_text_welcome.dart';
import 'package:tourism_app/widgets/responsive_button.dart';
import 'package:tourism_app/pages/navpages/main_page.dart';

class Welcome_page extends StatefulWidget {
  const Welcome_page({Key? key}) : super(key: key);

  void navigateToHomePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Home_Page(), // Navigate to the home screen
    ));
  }

  @override
  State<Welcome_page> createState() => _Welcome_pageState();
}

class _Welcome_pageState extends State<Welcome_page> {
  List images=[
    "welcome_8.jpeg",
    "welcome_13.jpeg",
    "welcome_3.jpeg",
  ];
  List text=[
    "Your travel",
    "Escape... ",
    "Take only ",
  ];
  List text_1=[
    "has just begun",
    "Explore...",
    "memories,"
  ];
  final List<String> text_2=[
    "Enjoy the adventure",
    "“Make your holiday memorable”",
    "leave only footprints"
  ];

  // List<List<String>> texts = [
  //   ["Your travel", "has just begun", "Enjoy the adventure"],
  //   ["Escape...", "Explore...", "“Make your holiday memorable”"],
  //   ["Take only", "memories,", "leave only footprints"]
  // ];
  // int currentTextIndex = 0;
  // int currentCharIndex = 0;
  //
  // void startTyping(){
  //   if (currentCharIndex<text_2[currentTextIndex].length){
  //     currentCharIndex++;
  //   }else{
  //     currentTextIndex=(currentTextIndex+1)% text_2.length;
  //     currentCharIndex=0;
  //   }
  //   setState(() {
  //
  //   });
  //   Future.delayed(Duration(milliseconds: ))
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length, // no of page 3
          itemBuilder: (_, index){
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'images/'+images[index]
                    ),
                    fit: BoxFit.cover,
                    opacity: 2,

                  )
              ),
              child: Container(
                margin: EdgeInsets.only(top:150,left:20,right:20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(text: text[index],color: Colors.white,size: 50,),
                        AppText(text: text_1[index], size: 40,color: Colors.white),
                        SizedBox(height: 20,),
                        Container(
                          width: 250,
                          child: AppText(
                            text:text_2[index],
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                        SizedBox(height: 200,),
                        if (index==images.length-1)ResponsiveButton(
                          width: 160,
                          text: 'Get started',
                onPressed: () {
                  // Navigate to the desired page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage()),
                  );
                }),
                      ],
                    ),

                    ///  side dots ///

                    Column(
                      children: List.generate(3, (indexDots)
                      {
                        return Container(
                          /// index dots slider ///
                          margin: EdgeInsets.only(bottom: 2),
                          width: 8,
                          height: index==indexDots?25:8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: index==indexDots?Colors.cyanAccent:Colors.greenAccent.withOpacity(0.3),
                          ),
                        );
                      }
                      ),
                    )
                  ],
                ),
              ),
              // child: SafeArea(
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(vertical: 65,horizontal: 25),
              //    child: Column(
              //        children:[
              //          Text("Enjoy",
              //            style:
              //              GoogleFonts.angkor()
              //          )
              //        ]
              //    ),
              //   ),
              // ),
            );


          }),

    );
  }
}
