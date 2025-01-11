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
      margin: EdgeInsets.only(right: 8,left: 8,top: 8,bottom: 0),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 32.0),
        child: Column(

          children: [
            //Account Profile
            Account_Profile(),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Expanded(
                //   child: Text("Options",
                //   style: GoogleFonts.plusJakartaSans(
                //     fontWeight: FontWeight.bold,
                //     fontSize: 18,
                //     color: Colors.black
                //   ),),
                //),
              ],
            ),

            SizedBox(height: 8,),
            Expanded(child: ListView.builder(
              itemCount: accountData.length,
              itemBuilder: (context, index) {
                final item = accountData[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0), // Spacing between tiles
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


// ListView(
//   children: [
//     Container(
//       child: Column(
//         children: [
//           for (accountModel some in accountData) OptionTile(account: some),
//         ],
//       ),
//     ),
//   ],
// )

// ListView(
//   children: [
//     for (accountModel some in accountData) OptionTile(account: some),
//   ],
// )

// for(accountModel some in accountData )
//   OptionTile(account: some),

// ListView(
//   children: [
//     Container(
//       child: Column(children: [
//           for(accountModel some in accountData )
//                   OptionTile(account: some),]
//           ),
//         )
//   ],
// )


// class _AccountBodyContentState extends State<AccountBodyContent> {
//   final accountData = accountModel.accountContent();
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Account_Profile(),
//           Text(
//             "Options",
//             style: GoogleFonts.plusJakartaSans(
//               fontWeight: FontWeight.bold,
//               fontSize: 18,
//               color: Colors.black,
//             ),
//           ),
//           const SizedBox(height: 16), // Add some spacing
//           Expanded(
//             child: ListView.builder(
//               itemCount: accountData.length,
//               itemBuilder: (context, index) {
//                 final item = accountData[index];
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 4.0), // Spacing between tiles
//                   child: Material(
//                     color: Colors.white, // Background color of the tile
//                     elevation: 4, // Adds shadow to the tile
//                     borderRadius: BorderRadius.circular(8), // Rounded corners
//                     child: Container(
//                       height: 54,
//                       padding: const EdgeInsets.symmetric(horizontal: 8), // Inner padding
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           // Leading widget
//                           if (item.leading != null) item.leading!,
//                           // Title
//                           Expanded(
//                             child: Text(
//                               item.title ?? "",
//                               style: const TextStyle(fontSize: 16),
//                               overflow: TextOverflow.ellipsis, // Handle long text
//                             ),
//                           ),
//                           // Trailing icon
//                           SvgPicture.asset(
//                             "assets/svg_icons/account_svg/arrow_right.svg_icons",
//                             width: 24,
//                             height: 24,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
