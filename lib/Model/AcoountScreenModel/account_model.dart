import 'package:eatfit_delivery_partner/Go_Router/routeDefination.dart';
import 'package:eatfit_delivery_partner/util/asset/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class accountModel{
  final SvgPicture leading;
  final String? title;
  String navigation;
  final VoidCallback onClicked;
  //final BuildContext context;

  accountModel({required this.leading,this.title = "",this.navigation = "",required this.onClicked});

  static List<accountModel> accountContent(BuildContext context){

    return[
      accountModel(
        leading: SvgPicture.asset(staticIcons.user),
        title: "Edit Profile",
        onClicked: (){},
        navigation: "${pageRoute.accountScreen}/${pageRoute.editProfile}"//context.go("${pageRoute.accountScreen}/${pageRoute.editProfile}"),
      ),

      accountModel(
        leading: SvgPicture.asset("asset/svg_icons/favourite.svg"),
        title: "Allotted Area",
        onClicked: (){},
      ),

      accountModel(
        leading: SvgPicture.asset("asset/svg_icons/Gift_light.svg"),
        title: "Refer and Earn",
        navigation: "${pageRoute.accountScreen}/${pageRoute.referScreen}",
        onClicked: (){},
      ),

      accountModel(
        leading: SvgPicture.asset("asset/svg_icons/Support.svg"),
        title: "Support",
        onClicked: (){},
      ),

      accountModel(
        leading: SvgPicture.asset("asset/svg_icons/faq.svg"),
        title: "FAQ",
        onClicked: (){},
      ),

      accountModel(
        leading: SvgPicture.asset("asset/svg_icons/terms_and_condition.svg"),
        title: "Terms and Conditions",
        onClicked: (){},
      ),

      accountModel(
        leading: SvgPicture.asset("asset/svg_icons/privacy_policy.svg"),
        title: "Privacy Policy",
        onClicked: (){},
      ),

      accountModel(
        leading: SvgPicture.asset("asset/svg_icons/messsage_open_light.svg"),
        title: "Ask For Leave",
        navigation: "${pageRoute.accountScreen}/${pageRoute.askForLeave}",
        onClicked: (){},
      ),

      accountModel(
        leading: SvgPicture.asset("asset/svg_icons/singout.svg"),
        title: "Log Out",
        onClicked: (){
         // FirebaseAuthRepoAuthentication().signOut(context);
          },
        //onClicked: (){}

      ),
    ];
}

}


