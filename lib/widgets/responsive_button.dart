
import 'package:flutter/material.dart';
class ResponsiveButton extends StatelessWidget {
bool? isResponse;
double? width; // optional
final String text;
final VoidCallback? onPressed;

 ResponsiveButton({Key? key, this.width,
    this.isResponse=false,
    required this.text,
   this.onPressed,   // navigation between pages
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed, /// navigation between pages
      child: Container(
        width: width,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ) ,

        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/button.jpeg',),
            // SizedBox(width: 8), // Adjust the spacing between image and text
            Center(
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.black, // Customize text color as needed
                  fontSize: 20, // Customize font size as needed
                  fontWeight: FontWeight.bold, // Customize font weight as needed
                ),
              ),
            ),
          ],
        ),

      ),
    );
  }
}
