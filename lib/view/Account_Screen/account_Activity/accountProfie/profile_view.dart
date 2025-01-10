import 'package:eatfit_delivery_partner/util/asset/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../provider/GlobalProvide/profileNotifier.dart';
import '../../../../util/asset/image assest.dart';

class Account_Profile extends StatefulWidget {
  const Account_Profile({super.key});

  @override
  State<Account_Profile> createState() => _Account_ProfileState();
}

class _Account_ProfileState extends State<Account_Profile> {

  @override
  void initState() {

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<profileNotifier>(context, listen: false).fetchProfileDetailsApi();
      final loginProvider = Provider.of<profileNotifier>(context, listen: false);
      //if(loginProvider != )
    });
  }
  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    return Consumer<profileNotifier>(
      builder: (context,profileUpdater,value) =>
      profileUpdater.profileData?.data != null ?
       Container(
        margin: EdgeInsets.only(bottom: 16),
        width: 355,
        child:Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  CircleAvatar(
                      radius: width * 0.14,
                      backgroundImage:profileUpdater.profileData?.data?.profileImage != null
                          ? NetworkImage(profileUpdater.profileData!.data!.profileImage) as ImageProvider // Use MemoryImage for Uint8List
                          : AssetImage(staticImages.defalutProfile) as ImageProvider//NetworkImage('https://images.app.goo.gl/weyP1VuhtLGJPMjb7') as ImageProvider,
                  ),
                  SizedBox(width: 16),

                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: SvgPicture.asset(staticIcons.user),
                              ),
                              Text(profileUpdater.profileData!.data!.firstName,
                              style: GoogleFonts.istokWeb(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),),
                              Spacer(),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(50)),
                                  color: Colors.white,
                                ),
                                child:
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("4.9"),
                                    SizedBox(width: 4),
                                    SvgPicture.asset(staticIcons.star)
                                  ],
                                ),
                              )
                            ],
                          ),

                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: SvgPicture.asset(staticIcons.phone),
                            ),
                            Text(profileUpdater.profileData!.data!.mobileNumber,
                              style: GoogleFonts.istokWeb(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),),
                          ],
                        ),

                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: SvgPicture.asset(staticIcons.message),
                            ),
                            Text(profileUpdater.profileData!.data!.email,
                              style: GoogleFonts.istokWeb(
                                fontSize: profileUpdater.profileData!.data!.email.length > 20 ? 12 :16,
                                fontWeight: FontWeight.normal,

                              ),
                            ),
                          ],
                        ),
                      ]
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ): CircularProgressIndicator()
    );
  }
}
