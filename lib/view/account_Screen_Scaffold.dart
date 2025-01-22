import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../util/asset/icons.dart';
import 'Account_Screen/account_Activity/account_Screen_assembled.dart';

class MyAccountMain extends StatefulWidget {
  const MyAccountMain({super.key});

  @override
  State<MyAccountMain> createState() => _MyAccountMainState();
}

class _MyAccountMainState extends State<MyAccountMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,  //(0xFFE8E8E8),
      appBar: AppBar(
        centerTitle: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)
            )),
        title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
            SvgPicture.asset(
              staticIcons.user_black, // Fixed the typo in 'assets'
              height: 24, // Adjust size as needed
            ),
           SizedBox(width: 8), // Spacer between logo and text
          Text(
            "Account",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: Colors.black
            ),
          ),
        ],
      ),
      //titleTextStyle: ,
        //backgroundColor: ,
        flexibleSpace: ClipRRect(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)
            ),

          child: Container(decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Color(0x88FB9A4D),
              Color(0x88FF4651)],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight),
          ),),
        ),
      ),
      body: AccountBodyContent()
    );
  }
}
