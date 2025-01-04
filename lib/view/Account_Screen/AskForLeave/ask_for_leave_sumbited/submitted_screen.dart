import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SubmittedScreen extends StatelessWidget {
  const SubmittedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Image.asset("assest/images/advertisment/tickmark.png"),
          SizedBox(
            height: 135,
            width: 135,
            child: Lottie.asset("assets/animation/tick1.json",
                repeat: true),
          ),

          SizedBox(height: 38,),
          Text("  Your application is \nsubmitted successfully",
            style: GoogleFonts.istokWeb(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: Colors.black,
          ),),

          SizedBox(height: 32,),
          Text("Please wait and check your application \n       status under My Application",
            style: GoogleFonts.istokWeb(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xFF595959),
            ),),

          SizedBox(height: 32,),

          Center(
            child: Container(
              width: 230,
              height: 58,
              decoration: BoxDecoration(color: Colors.transparent),
              child: ElevatedButton(
                onPressed: () {
                  // Add your button action here
                  context.go("/account");
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Rounded edges
                  ),
                  side: BorderSide(
                    color: Color(0xFFFF5963), // Border color
                    width: 2, // Border width
                  ),
                ),

                child: Text(
                  "Okay",
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    color: Color(0xFFFF5963),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
