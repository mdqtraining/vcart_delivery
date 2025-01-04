import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FrequentlyAskedQuesitons extends StatelessWidget {
  const FrequentlyAskedQuesitons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      child: Column(
       // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text("Frequently Asked Questions",
              style: GoogleFonts.quicksand(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
              ),),
          ),
          dividingLine(),
          Padding(
            padding: const EdgeInsets.only(left: 40,top: 6,right: 26),
            child: Row(//mainAxisSize: MainAxisSize.max,
              children: [
                Text("What is EatFit?",
                  style: commonFont()),
                //SizedBox(width: 160,),
                Spacer(),
                Icon(Icons.add,color: Color(0xFF34A853),)
              ],
            ),
          ),
          dividingLine(),

          Padding(
            padding: const EdgeInsets.only(left: 40,top: 6,right: 26),
            child: Row(
              children: [
                Text("How to invite a user?",
                    style: commonFont()),
                Spacer(),
                Icon(Icons.add,color: Color(0xFF34A853),)
              ],
            ),
          ),
          dividingLine(),

          Padding(
            padding: const EdgeInsets.only(left: 40,top: 6,right: 26),
            child: Row(
              children: [
                Text("How to withdraw money from wallet?",
                    style: commonFont()),
                Spacer(),
                Icon(Icons.add,color: Color(0xFF34A853),)
              ],
            ),
          ),
          dividingLine(),

          Padding(
            padding: const EdgeInsets.only(left: 40,top: 6,right: 26),
            child: Row(
              children: [
                Text("How to know status of a query?",
                    style: commonFont()),
                Spacer(),
                Icon(Icons.add,color: Color(0xFF34A853),)
              ],
            ),
          ),
          dividingLine(),

          Padding(
            padding: const EdgeInsets.only(left: 40,top: 6,right: 26),
            child: Row(
              children: [
                Text("How to apply a referral code?",
                    style: commonFont()),
                Spacer(),
                Icon(Icons.add,color: Color(0xFF34A853),)
              ],
            ),
          ),
          dividingLine(),

          Padding(
            padding: const EdgeInsets.only(left: 40,top: 6,right: 26),
            child: Row(
              children: [
                Text("How to apply for a campaign?",
                    style: commonFont()),
                Spacer(),
                Icon(Icons.add,color: Color(0xFF34A853),)
              ],
            ),
          ),
          dividingLine(),



        ],
      ),
    );
  }
  Divider dividingLine(){
    return Divider(
      color: Color(0xFFD6D6D6), // Line color
      thickness: 1,       // Line thickness
      indent: 0,         // Left margin
      endIndent: 10,
    );
}

TextStyle commonFont(){
    return GoogleFonts.istokWeb(
      fontWeight: FontWeight.normal,
      fontSize: 16,
      color: Color(0xFF57585A)

    );
}
}
