import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourism_app/pages/Map_Page.dart';

import '../../widgets/app_buttons.dart';
import '../../widgets/app_large_text.dart';
import '../../widgets/app_text_welcome.dart';

class DetailPage2 extends StatefulWidget {
  const DetailPage2({Key? key}) : super(key: key);

  @override
  State<DetailPage2> createState() => _DetailPage2State();
}

class _DetailPage2State extends State<DetailPage2> {
  int gottenStars=4;
  int selectedindex=-1;
  int numberOfPeople=1;  // initial value fixed
  int basePrice=1000;     // initial base price

  // function to calculate price dynamcically

  int calculatePrice(int numberOfPeople){
    return basePrice+(numberOfPeople-1)*1000;
  }
  @override
  Widget build(BuildContext context) {

    int totalPrice=calculatePrice(numberOfPeople);

    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(
          children: [
            Positioned(                                    // image
                left: 0,
                right: 0,
                child:Container(
                  width: double.maxFinite,
                  height: 350,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/goa_2.jpeg'),
                        fit: BoxFit.cover,
                      )
                  ),
                ) ),
            Positioned(                       // arrow present down
                left: 20,
                top: 40,
                child: Row(
                  children: [
                    IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: Icon(
                        Icons.arrow_back_ios),
                      color: Colors.black,

                    )
                  ],
                )),
            Positioned(                                         // containner inside designing
                top: 320,
                child: Container(
                  padding: EdgeInsets.only(left: 20,right: 20,top: 30),
                  //color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)
                      )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Goa',
                            style: GoogleFonts.akshar(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          Text('\₹$totalPrice ',style: TextStyle(
                              color: Colors.black,
                              fontSize: 18
                          ),)

                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Icon(Icons.location_on,color: Colors.redAccent,),
                          SizedBox(width: 5,),
                          Text('Goa',style: GoogleFonts.alexandria(
                              fontSize: 15,color: Colors.black54
                          ),)
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                          children: [
                            // stars //
                            Wrap(
                              children:
                              List.generate(5, (index){
                                return Icon(Icons.star,color: index<gottenStars?Colors.yellow:Colors.grey,); // star condition for 1 star grey
                              }),
                            ),
                            SizedBox(width: 10,),
                            AppText(text: '(4.0)',color: Colors.black45,)
                          ]),
                      SizedBox(height: 25,),
                      AppLargeText(text: 'People',color: Colors.black,size: 20,),
                      SizedBox(height: 10,),
                      AppText(text: 'Number of People in your group',color: Colors.black38,size: 16,),
                      SizedBox(height: 10,),
                      Wrap(
                          children:
                          List.generate(5, (index) {
                            // buttons are present in app button .dart file//
                            return InkWell(
                              onTap: (){
                                setState(() {
                                  selectedindex=index;
                                  numberOfPeople=index+1;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                child: AppButtons(
                                  color: selectedindex==index?Colors.black:Colors.white,
                                  size: 50,
                                  backgroundcolor: selectedindex==index?Colors.black:Colors.grey,
                                  borderColor: selectedindex ==index?Colors.black:Colors.black12,
                                  text: (index+1).toString(),
                                ),
                              ),
                            );
                          })
                      ),
                      SizedBox(height: 20,),
                      AppLargeText(text: 'Description',color: Colors.black54,size: 20,),
                      SizedBox(height: 10,),
                      AppText(text: 'Goa is a state in India that is known for its beaches, nightlife, and architecture. It is located on the southwestern coast of India, between the Indian states of Maharashtra and Karnataka. ',color: Colors.black87,size: 16,),
                      // AppText(text: 'The city is called place of the thunderbolt, and it is  also known as the "Queen of the Hills"',color: Colors.black87,size: 16),
                    ],

                  ),
                )),
            Positioned(
                bottom: 20,
                left: 20 ,
                right: 20,  // low fixed boxex
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppButtons(
                      color: Colors.black54,
                      size: 60,
                      backgroundcolor: Colors.white,
                      borderColor: Colors.black,
                      isIcon: true,
                      icon: Icons.favorite_border,
                    ),
                    SizedBox(width: 20,),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Map_page()),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed)) {
                              return Colors.grey; // Change to the desired color when pressed
                            }
                            return Colors.indigo; // Default color
                          },
                        ),
                        elevation: MaterialStateProperty.all<double>(3),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                        child: Text(
                          'Explore',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )



                  ],


                ))
          ],

        ),
      ),
    );
  }
}
