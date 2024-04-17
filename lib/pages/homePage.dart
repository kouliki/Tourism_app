// Example code for HomePage:

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourism_app/pages/Map_Page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBodyBehindAppBar: true,


      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 100,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Navigator.pop(context);
          },
        ),
        // title: Text('Explore New Places',style:
        //   GoogleFonts.alkalami(fontSize: 30,
        //     color: Colors.black,fontWeight: FontWeight.w600,
        //   )
        //   ,),
        bottom:  PreferredSize(

          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              'Explore New Places',
              style: GoogleFonts.allison(fontSize: 60,
                color: Colors.black,fontWeight: FontWeight.w600,
              )
            ),
          ),
          preferredSize: Size.fromHeight(20),
        ),
      ),

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'images/images.jpeg'
              ),
            fit: BoxFit.cover,
          )
        ),



        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Map_page()), //// connection between two pages
                  );
                },
                child: Text('Go to Map'),
              ),
              SizedBox(height: 20,),
              Padding(
                  padding: EdgeInsets.fromLTRB(30,10,40,0),
                  // padding: EdgeInsets.fromLTRB(30,10,40,0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'search a location',
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 20),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)
                          )
                        ),
                        
                      ),
                      SizedBox(height: 20),
                      TextField(
                        decoration: InputDecoration(
                          
                          hintText: 'search a location',
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)
                          ),

                        ),
                      ),
                    ],
                  ),
              )],
          ),
        ),
      ),
    );
  }
}
