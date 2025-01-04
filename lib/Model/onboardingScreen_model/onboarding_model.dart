import 'package:eatfit_delivery_partner/util/asset/animation.dart';
import 'package:lottie/lottie.dart';

class onBoardingAssests{
  LottieBuilder animation;
  String Headline;
  String slogan;

  onBoardingAssests({
    required this.animation,
    required this.Headline,
    required this.slogan,
  });

  static List<onBoardingAssests> assetOfOnBoarding(){
    return[
      onBoardingAssests(
          animation: Lottie.asset(animations.atyourEyeSight),
          Headline: " Your Safety\n"
              "is our Priority",
          slogan: "     order from your home here\nwe are to delivery what you want, "),

      onBoardingAssests(
          animation: Lottie.asset(animations.safedrive),
          Headline: "      Fast Delivery\nDon't worry Be happy",
          slogan: "our boys are very well in driving\n so dont fear while your fodd in here"),

      onBoardingAssests(
          animation: Lottie.asset(animations.onTime),
          Headline: "Where it is!\n  Here it is",
          slogan: "locate ypur food where it is travelling\n      around your are this wold"),
    ];
  }
}