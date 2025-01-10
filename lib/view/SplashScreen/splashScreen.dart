import 'package:eatfit_delivery_partner/provider/GlobalProvide/LoginChangeNotifierl.dart';
import 'package:eatfit_delivery_partner/util/asset/string.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Go_Router/routeDefination.dart';
import '../../provider/GlobalProvide/profileNotifier.dart';
import '../LoginScreen/Login_Input/LoginScreen.dart';

class SplashScreen extends StatefulWidget  {

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>  with TickerProviderStateMixin{

  void splashNavigator() async{

    await Future.delayed(Duration(seconds: 4));

    final prefs = await SharedPreferences.getInstance();
    final hasViewedOnboarding = prefs.getBool(NamingStrings.viwedSplashScreen) ?? false;
    final bearerToken = prefs.getString(NamingStrings.bearerToken);

    if (!hasViewedOnboarding) {
      if(mounted){
        context.go(pageRoute.onboarding);
      } // Navigate to onboarding
    }
    else if(bearerToken == null) {
      if(mounted){
        context.go(pageRoute.Login_input);
      } // Navigate to login
     }
    else {
        context.go(pageRoute.homePage);
    }
  }

  @override
  Widget build(BuildContext context) {

    splashNavigator();
    return Scaffold(
        body: Stack(
            children: [
              Positioned(
                left: -298.73,
                top: 62.33,
                child: Transform.rotate(
                  angle: 135 * 3.14 / 180,
                  child: Container(
                    height: 445,
                    width: 600,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(150)),
                      color: Color(0xFFFFF7EC),
                    ),
                  ),
                ),
              ),

              Positioned(
                left: -318.73,
                top: 62.33,
                child: Transform.rotate(
                  angle: 135 * 3.14 / 180,
                  child: Container(
                    height: 502,
                    width: 750,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(150)),
                        color: Colors.transparent,
                        border: Border.all(color: Color(0x4DFF5963))
                    ),
                  ),
                ),
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Eat",
                        style: GoogleFonts.radioCanada(
                            fontSize: 102,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF000000)
                        ),
                      ),

                      Text("Fit",
                        style: GoogleFonts.radioCanada(
                            fontSize: 102,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFFFF5963)
                        ),
                      )
                    ],
                  ),

                  Center(
                    child: Text("Delivery Partner",
                      style: GoogleFonts.quicksand(
                          fontSize: 26,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFFFF5963)
                      ),
                    ),
                  ),
                ],
              )
            ]
        )
    );
  }
}


