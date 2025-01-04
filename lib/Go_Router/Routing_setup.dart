import 'package:eatfit_delivery_partner/Go_Router/routeDefination.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
//import '../view/OnBoardingScreen/onBoardingScreen.dart';
import '../app_components/bottomNavigation.dart';
import '../view/Account_Screen/AskForLeave/ask_for_leave.dart';
import '../view/Account_Screen/AskForLeave/ask_for_leave_sumbited/submitted_screen.dart';
import '../view/Account_Screen/EditProfile/editProfiel.dart';
import '../view/Account_Screen/ReferAndEarn/refer_and_earn_screen.dart';
import '../view/LoginScreen/Login_Input/LoginScreen.dart';
import '../view/LoginScreen/Login_Successfull/login_successfull.dart';
import '../view/LoginScreen/Login_VerificationScreen/otp_verification_Screen.dart';
import '../view/OnBoardingScreen/onBoardingScreen.dart';
import '../view/SplashScreen/splashScreen.dart';
import '../view/account_Screen_Scaffold.dart';

class AppRouter {
  GoRouter router = GoRouter(
      routes: [
        //SplashScreen
        GoRoute(
          path: pageRoute.splashScreen,
          pageBuilder: (context, state) {
            return MaterialPage(
              key: state.pageKey,
              child: SplashScreen(),
            );
          },
        ),

        //OnboardingAdvertismentScreen
        GoRoute(path: pageRoute.onboarding,
            pageBuilder: (context,state){
              return MaterialPage(
                  child: OnBoardingScreen());
            }),

        //LoginInputScreen
        GoRoute(path: pageRoute.Login_input,
            pageBuilder: (context,state){
              return MaterialPage(child: LoginScreen());
            }),

        //OnBoardingScreenSecond
        GoRoute(path: pageRoute.Login_verification,
            pageBuilder: (context,state){
              final String verificationId = state.extra.toString();
              return MaterialPage(
                  child: LoginVerification());
            }),

        // //onScussess
        GoRoute(path: pageRoute.onSuccess,
            pageBuilder: (context,state){
              return MaterialPage(child: onSucssess());
            }),

        //StartingPoint
        GoRoute(path: pageRoute.homePage,
            pageBuilder: (context,state){
              return MaterialPage(child: MainRouteStarts());
            }),

        //AccountScreen
        GoRoute(path: pageRoute.accountScreen,
            pageBuilder: (context,state){
              return MaterialPage(child: MyAccountMain());
            },routes: [

              //ReferAndEarnScreen
              GoRoute(path: pageRoute.editProfile,
                  pageBuilder: (context,state){
                    return MaterialPage(child: EditProfiele());
                  }),

              //ReferAndEarnScreen
              GoRoute(path: pageRoute.referScreen,
                  pageBuilder: (context,state){
                    return MaterialPage(child: ReferAndEarnScreen());
                  }),

              //ask for leave Screen
              GoRoute(path: pageRoute.askForLeave,
                  pageBuilder: (context,state){
                    return MaterialPage(child: AskForLeave());
                  },
                  routes: [
                    //ask for leave success
                    GoRoute(path: pageRoute.askForLeave_success,
                        pageBuilder: (context,state){
                          return MaterialPage(child: SubmittedScreen());
                        }),
                  ]
                ),
            ]),
      ]
  );
}