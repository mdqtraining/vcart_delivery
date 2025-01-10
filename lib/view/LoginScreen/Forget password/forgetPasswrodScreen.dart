import 'package:eatfit_delivery_partner/provider/GlobalProvide/LoginChangeNotifierl.dart';
import 'package:eatfit_delivery_partner/util/asset/animation.dart';
import 'package:eatfit_delivery_partner/util/asset/image%20assest.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../Go_Router/routeDefination.dart';
import '../../../Model/AccountLogin/loginModel.dart';
import '../../../app_components/countryCodeSelector.dart';
//import 'countryCodeSelector.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const  ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
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

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final loginProvider = Provider.of<LoginProvider>(context);

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
                              child: Image.asset(staticImages.forgetPassword,
                                height: height * 0.33,
                                width: width * 0.6,)),

                          Padding(
                            padding: EdgeInsets.only(
                                top: height * 0.36, left: width * 0.06),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Partner are you forget your password!",
                                  style: GoogleFonts.istokWeb(
                                    fontSize: 18, //WidthSize*0.05,
                                    fontWeight: FontWeight.w600,
                                    height: 1.5,
                                  ),
                                ),
                                Text(
                                  "Dont't wory you will \nconnect soon..!",
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
                            padding: const EdgeInsets.only(left: 16),
                            child: Text(
                              "Forget Password!",
                              style: GoogleFonts.radioCanada(
                                fontSize: 18, //WidthSize*0.045,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          SizedBox(height: height * 0.02),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: width * 0.04),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CountryCodeSelector(),
                                SizedBox(width: 6.4,),
                                Container(
                                  height: height*0.06,
                                  width: width*0.73,
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

                                      hintText: "E.g. 99999 88888",
                                      hintStyle: GoogleFonts.inter(
                                          fontSize: 14,
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
                                horizontal: width * 0.04, vertical: height * 0),
                            child: Container(
                              height: height*0.06,
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

                                  hintText: "Enter New Password",
                                  hintStyle: GoogleFonts.inter(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: height * 0.1),

                          Center(
                            child: Container(
                              //constraints: ,
                              width: width * 0.8, //WidthSize * 0.9,
                              height: height * 0.066, //HeightSize * 0.07,

                              child: ElevatedButton(
                                onPressed: () async {

                                    await provider.forgetPasswordApi(
                                      deliveryPersonMobileNumber: mobileNumber_controller.text,
                                        newPassword: int.parse(password_controller.text),
                                    context: context);

                                    if(provider.error == true) {
                                      //final forgetPass = provider.forgetPasswordApi(deliveryPersonMobileNumber: "", newPassword: 0, context: context);
                                      print("::::::::::::::::true or False::::::::::::");
                                      print(provider.message);
                                      _showToast(
                                          context,
                                          provider.message ?? "Something went Wrong",
                                          Colors.white,Colors.black);
                                    }else{
                                      print("::::::::::::::::::::::::::::::::::::::::::");
                                      print(provider.logindata?.message);
                                      _showToast(
                                          context,
                                          provider.message ?? "no data found",
                                          Colors.green,
                                          Colors.white);
                                    }
                                  // }
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
                                child: loginProvider.isLoading
                                    ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    LottieBuilder.asset(animations.loading2),
                                    SizedBox(width: 24),
                                  ],
                                )
                                    : Text(
                                  "Change Password",
                                  style: GoogleFonts.inter(
                                    fontSize: 18, // WidthSize*0.05,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ), // ]
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

  void _showToast(BuildContext context,String addtext,Color color,Color textcolor) {
    //final scaffold = ScaffoldMessenger.of(context);
    //Container(child:  )
    Fluttertoast.showToast(
        msg: addtext,

        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        backgroundColor: color,
        textColor: textcolor,
        fontSize: 16
    );
  }
}

