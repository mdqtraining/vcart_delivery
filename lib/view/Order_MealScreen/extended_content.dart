import 'dart:math';

import 'package:eatfit_delivery_partner/util/asset/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Model/Orders/orders_getall.dart';
import '../../app_components/delivery_pickup_detail.dart';
import '../../Model/OrderMealModel/meal_page_model.dart';
import '../../provider/GlobalProvide/OrderList/particularPickupItemNotifier.dart';

class MealPageDetailedView extends StatefulWidget {

  //final OrderedProduct mealModel;
  const MealPageDetailedView({super.key});

  @override
  State<MealPageDetailedView> createState() => _MealPageDetailedViewState();
}

class _MealPageDetailedViewState extends State<MealPageDetailedView> {

  @override
  Widget build(BuildContext context) {
      return Consumer<ParticularPickupItemNotifier>(
        builder: (context,pickupCollection,child){

          final data = pickupCollection.particularPickupData?.data;
          print(":::::::::::Extendedcontent data::::::::::");
          print(data?.first.sellerName ?? "raghul");
          print(data?.first.contactNumber);
          print(data?.first.shopName);
          print(data?.first.totalAmount);
          print(data?.first.paymentStatus);
          print(data?.first.sellerAddress);
          print(data?.first.createdAt);


          //print(data?.first.contactNumber);
      return Column(
        children: [

          for (var index = 0; index<(data?.length ?? 0) ;index++)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 4, right: 10),
                              child: SvgPicture.asset(staticIcons.user_black),
                            ),

                            Text( "name need to display here",
                              style: GoogleFonts.istokWeb(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black
                              ),),
                            SizedBox(width: 38,),
                            SvgPicture.asset(
                                staticIcons.call)
                          ],
                        ),
                        SizedBox(height: 16,),
                        Row(children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: SvgPicture.asset(
                                staticIcons.pickuphands),
                          ),
                          Text("Pickup Center-1",
                            style: GoogleFonts.istokWeb(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.black
                            ),),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: SvgPicture.asset(
                                staticIcons.call),
                          ),
                          SvgPicture.asset(staticIcons.share)
                        ],
                        ),


                        SizedBox(height: 4,),
                        Padding(padding: EdgeInsets.only(left: 45),
                          child: Text(data?[index].sellerAddress ?? ""),),

                        SizedBox(height: 22),

                        // Row(children: [
                        //   Padding(
                        //     padding: const EdgeInsets.only(left: 8, right: 8),
                        //     child: SvgPicture.asset(
                        //         staticIcons.Vector),
                        //   ),
                        //   Text("Delivery",
                        //     style: GoogleFonts.istokWeb(
                        //         fontSize: 16,
                        //         fontWeight: FontWeight.w400,
                        //         color: Colors.black
                        //     ),),
                        //   Spacer(),
                        //   Padding(
                        //     padding: const EdgeInsets.only(right: 16.0),
                        //     child: SvgPicture.asset(
                        //         staticIcons.call),
                        //   ),
                        //   SvgPicture.asset(staticIcons.share)
                        // ],
                        // ),
                        //
                        // Padding(padding: EdgeInsets.only(left: 45),
                        //   child: Text("patinam paakam"),),

                        //SizedBox(height: 16),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DeliveryPickupDetail(),
                            ],
                          ),
                        ),

                        //SizedBox(height: 14),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 14),
                          child: clickableButton(),
                        )
                      ],
                    )
                  ],
                ),
              )
        ],
      );
      });
    }
  Center clickableButton(){
    return Center(
      child: Container(
        //constraints: ,
        width: 300,//WidthSize * 0.9,
        height: 52,//HeightSize * 0.07,
        child: ElevatedButton(
          onPressed: () {
            // Add your button action here
            // context.push('');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFF5963), // Button color
            padding: const EdgeInsets.symmetric(
              horizontal: 50,
              vertical: 15,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30), // Rounded edges
            ),
          ),

          child: Text(
            "Confirm Pickup",
            style: GoogleFonts.inter(
              fontSize: 16,// WidthSize*0.05,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
   }
  }

