import 'package:eatfit_delivery_partner/util/asset/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Model/AcoountScreenModel/account_model.dart';
import 'accountProfie/profile_view.dart';

class AccountBodyContent extends StatefulWidget {
  const AccountBodyContent({super.key});

  @override
  State<AccountBodyContent> createState() => _AccountBodyContentState();
}

class _AccountBodyContentState extends State<AccountBodyContent> {

  final acounInfo = accountModel(leading: SvgPicture.asset(staticIcons.bag),onClicked: (){});
  @override
  Widget build(BuildContext context) {
    final accountData = accountModel.accountContent(context);
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Color(0x22FB9A4D),
            Color(0x22FF4651)],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight)
      ),
      margin: EdgeInsets.only(right: 0,left: 0,top: 0,bottom: 0),
      child: Padding(
        padding: const EdgeInsets.only(top: 8,left: 8, right: 8,bottom: 32.0),
        child: Column(

          children: [
            //Account Profile
            Account_Profile(),

            SizedBox(height: 8,),
            Expanded(child: ListView.builder(
              itemCount: accountData.length,
              itemBuilder: (context, index) {
                final item = accountData[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 4), // Spacing between tiles
                  child: Material(
                    color: Colors.white, // Background color of the tile
                    elevation: 1, // Adds shadow to the tile
                    borderRadius: BorderRadius.circular(8),

                    // Rounded corners
                    child: InkWell(
                      onTap: () { context.push(item.navigation); } ,
                      child: Container(

                        height: 54,
                        padding: const EdgeInsets.only(left: 16,right: 16), // Inner padding
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Leading widget
                            if (item.leading != null) item.leading!,
                            // Title
                            SizedBox(width: 32,),
                            Expanded(
                              child: Text(
                                item.title ?? "",
                                style:  GoogleFonts.inter(
                                  fontSize: 17,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400
                                ),
                                overflow: TextOverflow.ellipsis, // Handle long text
                              ),
                            ),
                            // Trailing icon
                            SvgPicture.asset(
                              staticIcons.arrowRight,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            )
          ],
        ),
      ),
    );
  }
}

