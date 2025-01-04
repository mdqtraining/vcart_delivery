import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Go_Router/routeDefination.dart';
import 'otp_verification_button.dart';
import 'otp_verification_textfield.dart';

class LoginVerification extends StatefulWidget {
  const LoginVerification({super.key});

  @override
  State<LoginVerification> createState() => _LoginVerificationState();
}

class _LoginVerificationState extends State<LoginVerification> {
  final List<TextEditingController> controllers = List.generate(6, (index) => TextEditingController());

  //required this.verificationId
  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double widhth  = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading:  IconButton(icon: Icon(Icons.arrow_back_ios_new),
          onPressed: (){
            context.pop(pageRoute.Login_input);
          },),
        elevation: 0.0,
      ),


      body: Padding(
        padding: EdgeInsets.only(left: widhth*0.03, right: widhth*0.01),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              "Enter OTP to verify",
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: widhth*0.02),
            Text(
              "A 6 digit OTP has been sent to your phone",
              style: GoogleFonts.radioCanada(
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
            Row(
              children: [
                Text(
                  "9999988888",
                  style: GoogleFonts.radioCanada(
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(width: widhth*0.01),
                Text(
                  "change",

                  style: GoogleFonts.radioCanada(
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFFF5963),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: height*0.025),

            Text(
              "Enter OTP Text",
              style: GoogleFonts.radioCanada(
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: widhth*0.03),

            //Flexible(child: PinPutOTP()),
            OtpVerificationTextField(controllers: controllers),

            SizedBox(height: widhth*0.075),

            Button(inputvalueController: controllers),//controllers: controllers,verificationId: verificationId,
          ],
        ),
      ),
    );
  }
}
