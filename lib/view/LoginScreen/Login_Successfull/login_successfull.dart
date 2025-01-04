import 'package:eatfit_delivery_partner/util/asset/animation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../../../Go_Router/routeDefination.dart';

class onSucssess extends StatefulWidget {
  const onSucssess({super.key});

  @override
  State<onSucssess> createState() => _onSucssessState();
}

class _onSucssessState extends State<onSucssess> {

  bool showFirstAnimation = true;
  bool showSuccessText = false;

  @override
  void initState() {
    _startAnimation();
    _showText();
    super.initState();
  }

  void _startAnimation() async{
    await Future.delayed(const Duration(seconds: 4));
    setState(() {
      showFirstAnimation = false;
    });
  }

  void _showText() async{
    await Future.delayed(const Duration(seconds: 4));
    setState(() {
      showSuccessText = true;
    });
  }
  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    Future.delayed(Duration(seconds: 6), () {
      if(mounted) {
        context.go(pageRoute.homePage);
      }
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: showFirstAnimation ?
              Lottie.asset(animations.giftbox, width: 150,height: width*0.18) :

              Lottie.asset(animations.tickMark,repeat: false),

            ),

            if(showSuccessText)
              Text(
                "You have logged in Successfully..!\nConguragulations",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}
