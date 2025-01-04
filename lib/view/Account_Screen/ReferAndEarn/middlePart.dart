import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dotted_border/dotted_border.dart';

class MiddleContent extends StatelessWidget {
  const MiddleContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //crossAxisAlignment: CrossAxisAlignment.baseline,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16,left: 34),
            child: Column(
              children: [Row(
                children: [
                  SvgPicture.asset("assets/svg_icons/refer/invite.svg_icons"),
                  SizedBox(width: 16,),
                  Text("Invite your friends to EatFit",
                  style: GoogleFonts.istokWeb(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black
                  ),)
                ],
              ),

                SizedBox(height: 6,),

                Row(
                  children: [
                    SvgPicture.asset("assets/svg_icons/refer/referal.svg_icons"),
                    SizedBox(width: 16,),
                    Text("Your friend uses your referral code",
                      style: GoogleFonts.istokWeb(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black
                      ),)
                  ],
                ),

                SizedBox(height: 6,),

                Row(
                  children: [
                    SvgPicture.asset("assets/svg_icons/refer/gift.svg_icons"),
                    SizedBox(width: 16,),
                    Text("You get Rs. 75 in your wallet",
                      style: GoogleFonts.istokWeb(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black
                      ),)
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 24,),

          DottedBorder(
            dashPattern: [1, 3],
            strokeWidth: 2,
            radius: Radius.circular(10),
            child: Container(
              height: 75,
              width: 270,
              decoration: BoxDecoration(
                color: const Color(0xFF5963).withOpacity(0.17), 
                //borderRadius: BorderRadius.all(Radius.circular(10))
                // Container color with 17% opacity
                // border: Border.all(
                //   color: Colors.black, // Border color
                //   width: 1,
                //   style: BorderStyle.solid, // Dotted line isn't natively supported
                // ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Left Column
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Your referral code",
                          style: GoogleFonts.radioCanada(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "LOREM2331",
                          style: GoogleFonts.poppins(
                            color: Color(0xFFFF5963),
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
            
                  // Divider
                  Container(
                    width: 1,
                    height: 50,
                    color: Colors.black,
                  ),
            
                  // Right Column
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Copy",
                          style: GoogleFonts.radioCanada(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "code",
                          style: GoogleFonts.radioCanada(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
