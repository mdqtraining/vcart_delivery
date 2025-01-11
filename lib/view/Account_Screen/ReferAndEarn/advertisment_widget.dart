import 'package:eatfit_delivery_partner/util/asset/image%20assest.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdvertismentWidget extends StatelessWidget {
  const AdvertismentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 335,
      child: Stack(
        children: [
          Container(
            height: 290,
            width: double.infinity,
         // margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),),
              gradient: LinearGradient(colors: [Color(0xFFFB9A4D),
                Color(0xFFFF4651)],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight)
            ),
            child: Stack(
              children: [
                //SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 34.0,vertical: 24.0),
                  child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Refer & Earn",
                      style: GoogleFonts.quicksand(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),),

                      SizedBox(height: 4,),

                      RichText(text:
                      TextSpan(
                        text: "Upto",
                        style: GoogleFonts.radioCanada(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          color: Colors.white
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "₹100",
                            style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                color: Colors.white
                            )
                          )
                        ]
                      )
                      ),

                      //SizedBox(height: 6),

                      Divider(
                        color: Colors.white, // Line color
                        thickness: 1,       // Line thickness
                        indent: 0,         // Left margin
                        endIndent: 170, // Right margin
                      ),

                      SizedBox(height: 6),

                      Text("""
Invite your friends to
use EatFit Partner App &
get Rs. 75 when your 
friend uses your referral
code and completes a
successful delivery. """,
                        style: GoogleFonts.radioCanada(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),),
                    ],
                  ),
                ),

               // Card(color: Colors.black),
                Positioned(
                    right: 16,
                    top:30,
                    child: Image.asset(staticImages.man))
              ],
            ),
        ),
          Positioned(
            left: 54,
            top: 260,
            child: Container(
              width: 283,
              height: 52,
              //color: Colors.black,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(12),
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Refer Now",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          )
       ]
      ),
    );
  }
}


//routerConfig: AppRouter().router,
