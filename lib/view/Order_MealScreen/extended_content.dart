import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Model/Orders/orders_getall.dart';
import '../../app_components/delivery_pickup_detail.dart';
import '../../Model/OrderMealModel/meal_page_model.dart';

class MealPageDetailedView extends StatefulWidget {

  final OrderedProduct mealModel;
  const MealPageDetailedView({super.key,required this.mealModel});

  @override
  State<MealPageDetailedView> createState() => _MealPageDetailedViewState();
}

class _MealPageDetailedViewState extends State<MealPageDetailedView> {
  @override
  Widget build(BuildContext context) {
      return Container(

        margin: EdgeInsets.only(left: 11, top: 4, right: 20),
        //width: 357,
        color: Colors.white,
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
                      padding: const EdgeInsets.only(left: 4, right: 10),
                      child: SvgPicture.asset("assets/svg_icons/User_alt_light.svg_icons"),
                    ),

                    Text(widget.mealModel.paymentStatus,
                      style: GoogleFonts.istokWeb(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Colors.black
                      ),),
                    SizedBox(width: 38,),
                    SvgPicture.asset("assets/svg_icons/call.svg_icons")
                  ],
                ),
                SizedBox(height: 16,),
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: SvgPicture.asset("assets/svg_icons/pickuphands.svg_icons"),
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
                    child: SvgPicture.asset("assets/svg_icons/call.svg_icons"),
                  ),
                  SvgPicture.asset("assets/svg_icons/share.svg_icons")
                ],
                ),


                SizedBox(height: 4,),
                Padding(padding: EdgeInsets.only(left: 45),
                  child: Text("umachi kulam"),),

                SizedBox(height: 22),

                Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: SvgPicture.asset("assets/svg_icons/Vector.svg_icons"),
                  ),
                  Text("Delivery",
                    style: GoogleFonts.istokWeb(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black
                    ),),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: SvgPicture.asset("assets/svg_icons/call.svg_icons"),
                  ),
                  SvgPicture.asset("assets/svg_icons/share.svg_icons")
                ],
                ),


                Padding(padding: EdgeInsets.only(left: 45),
                  child: Text("patinam paakam"),),

                SizedBox(height: 16),

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
                  padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 14),
                  child: clickableButton(),
                )

              ],
            )
          ],
        ),
      );
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

