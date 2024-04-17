import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:tourism_app/pages/navpages/Home_Page.dart';
import 'package:tourism_app/pages/navpages/bar_item.dart';
import 'package:tourism_app/pages/navpages/my_page.dart';
import 'package:tourism_app/pages/navpages/search_page.dart';


///////// this is the main page which connects all other pages ////

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages=[
    Home_Page(),
    BarItem(),
  SearchPage(),
  MyPage(),

  ];
  int currentIndex=0;
  /// function for index///

  void onTap(int index){
    setState(() {
      currentIndex=index;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeInBack,
          buttonBackgroundColor: Colors.red,
          onTap: onTap,
          index: currentIndex,
          items: [
        CurvedNavigationBarItem(
      child: Icon(Icons.home),
      label: 'home',
    ),
            CurvedNavigationBarItem(
              child: Icon(Icons.bar_chart),
              label: 'bar',
            ),
            CurvedNavigationBarItem(
              child: Icon(Icons.search),
              label: 'Search',
            ),
            CurvedNavigationBarItem(
              child: Icon(Icons.person),
              label: 'Me',
            ),


    ////////////////


    //   body: pages[currentIndex],
    //   bottomNavigationBar: BottomNavigationBar(
    //     unselectedFontSize: 0,
    //     selectedFontSize: 0,
    //
    //     type: BottomNavigationBarType.shifting,
    //     backgroundColor: Colors.red,
    //     onTap: onTap,
    //     currentIndex: currentIndex,
    //
    //     selectedItemColor: Colors.black,
    //     unselectedItemColor: Colors.blueAccent,
    //     showSelectedLabels: false,
    //     showUnselectedLabels: false,
    //     elevation: 0,
    //     items: [
    //       BottomNavigationBarItem(icon: Icon(Icons.apps),
    //         // icon:Text('home')
    //         label: 'Hpme'
    //       ),
    //       BottomNavigationBarItem(icon: Icon(Icons.bar_chart_sharp),
    //           // icon:Text('Barchart')
    //           label: 'Hpme'
    //       ),
    //       BottomNavigationBarItem(icon: Icon(Icons.search),
    //           // icon:Text('search')
    //           label: 'Hpme'
    //       ),
    //       BottomNavigationBarItem(icon: Icon(Icons.person),
    //           // icon:Text('Me')
    //           label: 'Hpme'
    //       ),
    //     ],
    //   ),
    ]));
  }
}
