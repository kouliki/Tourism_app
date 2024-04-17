
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourism_app/pages/Edit_Profile.dart';
class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark=MediaQuery.of(context).platformBrightness== Brightness.dark;
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
          'Profile Corner',style: GoogleFonts.anticDidone(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.black,
        ),
        ),
        actions: [
          IconButton(onPressed: (){},
              icon:Icon(isDark?Icons.sunny:Icons.dark_mode_rounded,color: Colors.black,),
          )],
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
                  child: Icon(Icons.add,color: Colors.black,size: 20,),
                ),
              )

            ],
          ),
          SizedBox(height: 10,),
          Text('Kouliki Mahato',style: GoogleFonts.andadaPro(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
          Text('koulikimahato123@gmail.com',style: GoogleFonts.andadaPro(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          SizedBox(
            width: 150,
            child: ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfile()));
              },
              child: Text('Edit profile',style: TextStyle(
                color: Colors.black,fontSize: 16
              ),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,side: BorderSide.none,shape: StadiumBorder()
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange[300],side: BorderSide.none,shape: StadiumBorder()
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.phone,
                      color: Colors.black,
                      size: 16,
                    ),
                     SizedBox(width: 8,),
                     Text('call',style: TextStyle(
                        color: Colors.black,fontSize: 16
                    ),),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange[300],side: BorderSide.none,shape: StadiumBorder()
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.language_outlined,
                      color: Colors.black,
                      size: 16,
                    ),
                    SizedBox(width: 8,),
                    Text('Language',style: TextStyle(
                        color: Colors.black,fontSize: 16
                    ),),
                  ],
                ),
              ),

            ],
          ),
          SizedBox(height: 20,),
          Divider(),
          SizedBox(height: 10,),


          // menu
          ProfileMenuWidget(
            title: "Settings",icon: Icons.settings,onPress: (){},
          ),
          ProfileMenuWidget(title: 'Billing Details',icon: Icons.wallet,onPress: (){},),
          ProfileMenuWidget(title: "My Journey",icon: Icons.mode_of_travel_outlined,onPress: (){},),
          Divider(color: Colors.grey,indent: 10),
          SizedBox(height: 10,),
          ProfileMenuWidget(title: 'Credits & Coupons' ,icon: Icons.credit_card_rounded,onPress: (){},),
          ProfileMenuWidget(icon: Icons.help_center, title: 'Help Center', onPress: (){}),
          ProfileMenuWidget(
            title: 'Logout',icon: Icons.logout,textColor: Colors.redAccent,
            endIcon: false,
            onPress: (){},
          ),


          // Menu



          ],
      ),


    ),
    ),
    );
  }
}

// menu option //

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.onPress,
    this.endIcon=true,
    this.textColor,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {

    var isDark=MediaQuery.of(context).platformBrightness== Brightness.dark;
    var iconColor=isDark?Colors.cyan:Colors.indigo;

    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.white38,
        ),
        child: Icon(icon,color: iconColor,),
      ),
      title: Text(title,style: GoogleFonts.aladin(fontSize: 20,color: textColor),),
      trailing:endIcon? Container(
        width: 30,height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.grey[300],
        ),
        child: Icon(Icons.arrow_forward_ios,color: Colors.blueGrey,),
      ):null
    );
  }
}
