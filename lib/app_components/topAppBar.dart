
import 'package:eatfit_delivery_partner/util/asset/icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import '../Order_Activity/common_bottom_navigation.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {

  final bool lead;
  final String title;
  final bool showLogo;



  CommonAppBar({required this.lead,
    this.title = "Orders",
    this.showLogo = true,

    super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(

      leading: lead == false? Container() :
      IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            //Navigator.of(context).pop(navigation);
            context.pop();
          }// Go back to the previous screen,
      ),
      // : null,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)
          )),

      centerTitle: true,

      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showLogo)
            SvgPicture.asset(
              staticIcons.bag, // Fixed the typo in 'assets'
              height: 24, // Adjust size as needed
            ),
          if (showLogo) const SizedBox(width: 8), // Spacer between logo and text
          Text(
            title,
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: Colors.black
            ),
          ),
        ],
      ),

      elevation: 0, // Removes the shadow
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
