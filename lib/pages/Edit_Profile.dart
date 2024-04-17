import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourism_app/pages/navpages/my_page.dart';
class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          elevation: 10,
          backgroundColor: Colors.white,
          leading:
          IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(
              Icons.arrow_back_ios),
            color: Colors.black,

          ),
          title: Text(
            'Edit Profile',style: GoogleFonts.anticDidone(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
          ),
        ),
        body: SingleChildScrollView(
        child: Container(
        padding: EdgeInsets.only(left: 30,right: 30,top: 30),
    child: Column(
    children: [
    Stack(
    children: [
    SizedBox(width: 120,height: 120,
    child: ClipRRect(

    borderRadius: BorderRadius.circular(100),
    child: Image(
    image: AssetImage(
    'images/kouliki.jpg'),
    fit: BoxFit.cover
    ,
    )
    ),
    ),

    /// photo icon//

    Positioned(
    bottom: 0,
    right: 0,
    child: Container(
    width: 35,height: 35,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(100),
    color: Colors.greenAccent,
    ),
    child: Icon(Icons.add_a_photo_rounded,color: Colors.black,size: 20,),
    ),
    )

    ],
    ),
      SizedBox(height: 50,),
      Form(child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              label: Text('full name'),prefixIcon: Icon(Icons.person)
            ),
          ),
          SizedBox(height: 10,),
          TextFormField(
            decoration: InputDecoration(
                label: Text('Email id'),prefixIcon: Icon(Icons.mail_lock_outlined)
            ),
          ),
          SizedBox(height: 10,),
          TextFormField(
            decoration: InputDecoration(
                label: Text('phone no'),prefixIcon: Icon(Icons.phone)
            ),
          ),
          SizedBox(height: 10,),
          TextFormField(
            decoration: InputDecoration(
                label: Text('password'),prefixIcon: Icon(Icons.lock)
            ),
          ),
          SizedBox(height: 50,),
          SizedBox(
            width: 200,
            child: ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyPage()));
              },
              child: Text('Edit profile',style: TextStyle(
                  color: Colors.black,fontSize: 16
              ),),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,side: BorderSide.none,shape: StadiumBorder()
              ),
            ),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('joined 2nd March,2024',style: GoogleFonts.armata(
                fontSize: 16,color: Colors.indigoAccent,
              ),),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyPage()));
                },
                child: Text('Delete',style: TextStyle(
                    color: Colors.black,fontSize: 16
                ),),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[300],side: BorderSide.none,shape: StadiumBorder()
                ),
              ),
            ],
          )
        ],
      ))
    ]
    )
        )
        )
    );

  }
}
