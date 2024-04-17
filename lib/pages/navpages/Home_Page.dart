
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourism_app/pages/detail_page.dart';
import 'package:tourism_app/pages/detailed_pages/detailed_page1.dart';
import 'package:tourism_app/pages/detailed_pages/detailed_page2.dart';
import 'package:tourism_app/widgets/app_large_text.dart';
import 'package:tourism_app/widgets/app_text_welcome.dart';
class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> with TickerProviderStateMixin {
var category=[
  "Best Places",
  "Most Visited",
  "Favourites",
  "Hotels",
  "Restaurants",
  "New Added",
];

//  var is like a dictionary//
List city=[
  "darjeeling_1.jpeg",
  "kashmir.jpeg",
  "goa_2.jpeg",
];
List names=[
  "Darjeeling",
  "Kashmir",
  "Goa"
];

// 2. //
  List city_1=[
    "taj mahal.jpeg",
    "red fort.jpeg",
    "victoria memorial.jpeg",
  ];
  List names_1=[
    "Taj mahal",
    "Red fort",
    "Victoria Memorial"
  ];

  //3.//
  List city_2=[
    "ooty.jpeg",
    "munnar.jpeg",
    "sundarban.jpeg",
  ];
  List names_2=[
    "Ooty",
    "Munnar",
    "Sundarban"
  ];

// explore more images ////

var images={
  "balloning.jpeg":"balloning",
  "hiking.jpeg":"hiking",
  "canoening.jpeg":"canoening",
  "kayaking.jpeg":"kayaking",
  "snorkling.jpeg":"snorkling"
} ;

// navigation

  List<Widget> pages = [
    DetailPage(),
    DetailedPage1(),
  DetailPage2(),
  ];

  List<bool> isBookmarked = [false, false, false];
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 0.6,
                                    offset: Offset(5, 4)
                                ),

                              ],
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Icon(
                            Icons.sort_rounded,
                            size: 28,
                          )
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.red,
                        ),
                        Text(
                          'Durgapur,West Bengal',
                          style: GoogleFonts.aleo(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],

                    ),
                    //

                  ]),


            ),
            SizedBox(height: 20,),

            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(left: 30),
                child: AppLargeText(text: 'Discover'),
              ),
            ),

            SizedBox(height: 20,),

            // tab bar//

            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  labelPadding: EdgeInsets.only(left: 30, right: 30),
                  controller: _tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: [
                    Tab(
                      text: 'places',

                    ),
                    Tab(
                      text: 'Historical'
                    ),
                    Tab(
                      text: 'emotions'
                    ),

                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20),
              width: double.maxFinite,
              height: 300,
              child: TabBarView(
                controller: _tabController,
                children: [
                  //1.//
                  ListView.builder(
                    itemCount:3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder:(BuildContext context, int index){
                      return  GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => pages[index]), // Replace NewScreen() with the name of your new screen widget
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 10,top: 10),
                          width: 200,
                          height: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                  image:AssetImage(
                                    'images/'+city[index],),
                                  fit: BoxFit.cover,

                              )
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(top:10,right: 10),
                                alignment: Alignment.topRight,
                                child: IconButton(
                                  // Use IconButton instead of Icon to enable onPressed
                                  onPressed: () {
                                  },
                                  icon: Icon(
                                    Icons.bookmark_border,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Container(
                                padding: EdgeInsets.only(bottom: 20,left: 20),
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  names[index],
                                  style: GoogleFonts.amita(
                                    color: Colors.yellow,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18
                                  ),
                                ),
                              )
                            ],
                          ),

                        ),
                      );},

                  ),

                  //2.//

                  ListView.builder(
                    itemCount:3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder:(BuildContext context, int index){
                      return  GestureDetector(
                        onTap: (){
                          print(
                              'image clicked!'
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 10,top: 10),
                          width: 200,
                          height: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                  image:AssetImage(
                                      'images/'+city_1[index],),
                                  fit: BoxFit.cover
                              )
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(top:10,right: 10),
                                alignment: Alignment.topRight,
                                child: Icon(
                                  Icons.bookmark_border_outlined,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                              Spacer(),
                              Container(
                                padding: EdgeInsets.only(bottom: 20,left: 20),
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  names_1[index],
                                  style: GoogleFonts.amita(
                                      color: Colors.yellow,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18
                                  ),
                                ),
                              )
                            ],
                          ),

                        ),
                      );},

                  ),

                  /// 3.
                  ListView.builder(
                    itemCount:3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder:(BuildContext context, int index){
                      return  GestureDetector(
                        onTap: (){
                          print(
                              'image clicked!'
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 10,top: 10),
                          width: 200,
                          height: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                  image:AssetImage(
                                    'images/'+city_2[index],),
                                  fit: BoxFit.cover
                              )
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(top:10,right: 10),
                                alignment: Alignment.topRight,
                                child: Icon(
                                  Icons.bookmark_border_outlined,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                              Spacer(),
                              Container(
                                padding: EdgeInsets.only(bottom: 20,left: 20),
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  names_2[index],
                                  style: GoogleFonts.amita(
                                      color: Colors.yellow,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18
                                  ),
                                ),
                              )
                            ],
                          ),

                        ),
                      );},

                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
           SingleChildScrollView(
             scrollDirection: Axis.horizontal,
             child: Padding(
               padding: EdgeInsets.all(8),
               child: Row(
                 children: [
                   for (int i=0;i<6;i++)
                   Container(
                     margin: EdgeInsets.symmetric(horizontal: 10),
                     padding: EdgeInsets.all(10),
                     decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(8),
                       boxShadow: [
                         BoxShadow(
                           color: Colors.black54,
                           blurRadius: 4,
                         )
                       ]
                     ),
                     child: Text(
                       category[i],
                       style: GoogleFonts.anekMalayalam(
                         fontSize: 15,
                         fontWeight: FontWeight.w500,
                       ),
                     ),
                   )
                 ],
               ),
             ),
           ),

            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.only(left: 20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppLargeText(text: 'Explore more',size: 22,),
                  AppText(text: 'See all',color: Colors.black,)

                ],
              ),
            ),
            SizedBox(height: 30,),
            Container(
              height: 100,
              width: double.maxFinite,
              margin: EdgeInsets.only(left: 20),
              child: ListView.builder(
                itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index){
                    return Container(
                      margin: EdgeInsets.only(right: 30),
                      child: Column(
                        children: [
                      Container(
                      //margin: EdgeInsets.only(right: 50),
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      image: DecorationImage(
                      image:AssetImage(
                      'images/'+images.keys.elementAt(index),),
                      fit: BoxFit.cover
                      )
                      ),

                      ),
                        SizedBox(height: 5,),
                        Container(
                          child: AppText(
                            text: images.values.elementAt(index),
                            color: Colors.black,

                          ),
                        )
                        ],

                      ),
                    );
                  }
              ),
            )
            // SingleChildScrollView,
            // (
            // child: Column(
            //   children: [
            //     SizedBox(height: 10,),
            //   ],
            // ),
                 // Expanded(
            //   child: ListView.builder(
            //     physics: NeverScrollableScrollPhysics(),
            //       itemCount: 6,
            //       // shrinkWrap: true,
            //       itemBuilder: (BuildContext context,int index){
            //         return Padding(padding: EdgeInsets.all(15),
            //           child: InkWell(
            //             onTap: (){},
            //             child: Container(
            //               height: 150,
            //               decoration: BoxDecoration(
            //                 color: Colors.black54,
            //                 borderRadius: BorderRadius.circular(15),
            //                 image: DecorationImage(
            //                   image: AssetImage('images/'+city[index]),
            //                   fit: BoxFit.cover,
            //                 )
            //               ),
            //             ),
            //           ),
            //         );
            //       }),


          ],
        ));
  }
}


  // circle indicator under //
//   class CircleTabIndicator extends Decoration(
//   @override
//   BoxPainter createBoxPainter([VoidCallback ?onChanged])){
//     throw UnimplementedError();
//   }
//
// }

      
      // body: Column(
      //   children: [
      //     Container(
      //       padding: EdgeInsets.only(top:50,left: 10),
      //       child: Row(
      //
      //         children: [
      //           Icon(Icons.menu,size: 30,color: Colors.black45,),
      //           Expanded(child: Container()),
      //           Container(
      //             margin: EdgeInsets.only(right: 20),
      //             width: 50,
      //             height: 50,
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(10),
      //               color: Colors.grey.withOpacity(0.5),
      //             ),
      //
      //           )
      //         ],
      //       ),
      //     )
      //   ],
      //
      // ),
      // // appBar: AppBar(
      // //   toolbarHeight: 60,
      // //   backgroundColor: Colors.transparent,
      // //   elevation: 0,
      // //   leading: IconButton(
      // //     icon: Icon(Icons.menu),
      // //     color: Colors.black,
      // //     onPressed: (){},
      // //
      // //   ),
      // //     actions: [
      // // Padding(padding: EdgeInsets.only(right: 20.0,top:5),
      // // child:
      // // ClipOval(child: Image.asset('images/kouliki.jpg',fit: BoxFit.cover),
      // //
      // // ),
      // //
      // //
      // //     )
      // // ],),,
      //

