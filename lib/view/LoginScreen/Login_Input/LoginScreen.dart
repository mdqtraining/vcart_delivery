import 'package:eatfit_delivery_partner/provider/GlobalProvide/LoginChangeNotifierl.dart';
import 'package:eatfit_delivery_partner/util/asset/image%20assest.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../Go_Router/routeDefination.dart';
import '../../../Model/AccountLogin/loginModel.dart';
import 'countryCodeSelector.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController mobileNumber_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();

  bool _isClicked = false;
  bool _isLoading = false;
  int _errorAttempt = 0;
  String? _mobileNumber_error;

  void isClicke(bool Clicked) {
    setState(() {
      _isClicked = Clicked == true ? false: true;
    });
  }

  void isLoading(bool Loading) {
    setState(() {
      _isLoading = Loading == true ? false : false;
    });
  }

  void errorAttempt(){
    setState(() {
      ++_errorAttempt;
    });
  }

  void mobilNumberError(String? error){
    setState(() {
      _mobileNumber_error = error;
    });
  }



  // void initState() {// ->Needs to cover the coceptv
  //   super.initState();
  //   final login = Login(deliveryPersonPassword: password_controller.text,//int.parse(password_controller.text),
  //       deliveryPersonMobile: mobileNumber_controller.text, //int.parse(mobileNumber_controller.text)
  //   );
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     Provider.of<LoginProvider>(context, listen: false).login(login);
  //   });
  // }


  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final loginProvider = Provider.of<LoginProvider>(context);
    //var watch = context

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer<LoginProvider>(
            builder: (context,provider,child) =>
             Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: height * 0.53,
                        width: width,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Color(0xFFFFE8D6),
                                  //Color(0x61FC848B),
                                  Color(0xFFFF6B74),

                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.elliptical(0, 15),
                                bottomRight: Radius.elliptical(150, 60))),
                      ),

                      Positioned(
                          top: height * 0.03,
                          left: width * 0.20,
                          child: Image.asset(staticImages.deliveyBoy,
                            height: height * 0.33,
                            width: width * 0.6,)),

                      Padding(
                        padding: EdgeInsets.only(
                            top: height * 0.36, left: width * 0.06),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Be a Fit Partner",
                              style: GoogleFonts.istokWeb(
                                fontSize: 18, //WidthSize*0.05,
                                fontWeight: FontWeight.w600,
                                height: 1.5,
                              ),
                            ),
                            Text(
                              "Get a stable montly \nincome",
                              style: GoogleFonts.radioCanada(
                                fontSize: 28, //WidthSize*0.07,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.01),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 26),
                        child: Text(
                          "Enter Mobile Number",
                          style: GoogleFonts.radioCanada(
                            fontSize: 18, //WidthSize*0.045,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.06, vertical: height * 0),
                        child: Row(
                          children: [
                            CountryCodeSelector(),
                            Container(
                              height: 50,
                              width: 280,
                              child: TextField(
                                controller: mobileNumber_controller,
                                maxLength: 10,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
                                  errorText: _errorAttempt > 1
                                      ? _mobileNumber_error
                                      : null,
                                  counterText: "",

                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 2)),
                                  disabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 2.0)),
                                  errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 2.0)),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.orange, width: 2.0)),

                                  hintText: "e.g. 9999988888",
                                  hintStyle: GoogleFonts.radioCanada(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 16),

                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.06, vertical: height * 0),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12)
                          ),
                          child: TextField(
                            controller: password_controller,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12)
                              ),
                              errorText: _errorAttempt > 1
                                  ? _mobileNumber_error
                                  : null,
                              counterText: "",

                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 2)),
                              disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 2.0)),
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.red, width: 2.0)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.orange, width: 2.0)),

                              hintText: "enter Password",
                              hintStyle: GoogleFonts.radioCanada(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: height * 0.01),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Row(
                          children: [
                            Checkbox(
                              value: _isClicked,
                              onChanged: (value) {
                                isClicke(_isClicked);
                              },
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'By signing up I agree to the ',
                                    style: GoogleFonts.radioCanada(
                                        fontSize: 14, //WidthSize*0.035,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Terms of use',
                                        style: GoogleFonts.radioCanada(
                                            fontSize: 14, //WidthSize*0.035,
                                            fontWeight: FontWeight.normal,
                                            color: Color(0xFFFF5963)),
                                      ),
                                      TextSpan(
                                        text: "and",
                                        style: GoogleFonts.radioCanada(
                                            fontSize: 14, //WidthSize*0.035,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black),
                                      )
                                    ],
                                  ),
                                ),
                                Text(
                                  "Privacy Policy.",
                                  style: GoogleFonts.radioCanada(
                                      fontSize: 14, //WidthSize*0.035,
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xFFFF5963)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.02),

                      if(loginProvider.isLoading)
                        CircularProgressIndicator()
                      else...
                      [
                        Center(
                        child: Container(
                          //constraints: ,
                          width: width * 0.8, //WidthSize * 0.9,
                          height: height * 0.066, //HeightSize * 0.07,

                          child: ElevatedButton(
                            onPressed: () async {
                              print("the button clicked");
                              print("login_mobile>>>");
                              print(mobileNumber_controller.text);
                              print("login_password>>>");
                              print(password_controller.text);
                              await provider.loginAPI(mobileNumber: mobileNumber_controller.text,
                                  password: password_controller.text, context: context);
                            },

                            style: ElevatedButton.styleFrom(
                              backgroundColor: _isLoading
                                  ? Colors.white
                                  : Color(0xFFFF5963), // Button color
                              padding: const EdgeInsets.symmetric(
                                horizontal: 50,
                                vertical: 15,
                              ),
                              shape: _isLoading
                                  ? RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  side: BorderSide(
                                      color:
                                      Color(0xFFFF5963)) // Rounded edges
                              )
                                  : RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    30), // Rounded edges
                              ),
                            ),
                            child: _isLoading
                                ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircularProgressIndicator(
                                    strokeWidth: 2.0,
                                    color: Color(0xFFFF5963)),
                                SizedBox(width: 24),
                                Text(
                                  "Progressing",
                                  style: GoogleFonts.inter(
                                    fontSize: 18, // WidthSize*0.05,
                                    color: _isLoading
                                        ? Color(0xFFFF5963)
                                        : Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            )
                                : Text(
                              "Send OTP",
                              style: GoogleFonts.inter(
                                fontSize: 18, // WidthSize*0.05,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),]
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void _showToast(BuildContext context,String addtext) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(addtext),
        action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}



// String enteredText = mobileNumber_controller.text;
//
// if (enteredText.length < 10) {
//   errorAttempt();
//   mobilNumberError(
//       "Entered mobile number was wrong");
//       _showToast(contex,"entered value is wrong");
//   return;
// }
// if (_isClicked == false) {
//   errorAttempt();
//   mobilNumberError(
//       "Aggree to the policy");
//   _showToast(context, "policy agree");
//   return;
// }
// final login = Login(
//   deliveryPersonMobileNumber: mobileNumber_controller.text,//int.parse(mobileNumber_controller.text),
//   deliveryPersonPassword: password_controller.text,
// );
// String mobile = mobileNumber_controller.text;
//String password = password_controller.text;
