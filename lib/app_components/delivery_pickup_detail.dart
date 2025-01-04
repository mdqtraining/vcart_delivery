import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryPickupDetail extends StatefulWidget {
  const DeliveryPickupDetail({super.key});

  @override
  State<DeliveryPickupDetail> createState() => _DeliveryPickupDetailState();
}

class _DeliveryPickupDetailState extends State<DeliveryPickupDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(left: 24),
      child:Container(
        //margin: EdgeInsets.all(16),
        height: 150,
        width: 328,
        
        decoration: BoxDecoration(
           color:  Color(0x33FF5963),
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
           // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Delivery Pickup By",
                        style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFFF5963),
                        ),),
                      Text("Tommorow",
                        style: GoogleFonts.istokWeb(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF57585A)
                        ),),
                      Text("5:30 PM, Thu, 25/08/2023",
                        style: GoogleFonts.istokWeb(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF57585A)
                        ),)
                    ],
                  ),
                  Spacer(),
                  //SizedBox(width: 2,)
                  Container(
                    height: 62,
                      width: 113,
                    margin: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Row(children: [
                            SvgPicture.asset("assets/svg_icons/clock.svg_icons"),
                            Text("TIME LEFT",
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFFF5963)
                            ),)
                          ],),
                        ),

                        Text("1:04 Hrs",
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black
                          ),)
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Update Status",
                    style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFF5963)
                    ),),
                  //DropdownMenu(dropdownMenuEntries: dropdownMenuEntries)
                  Container(
                    height: 32,
                    width: 165,
                    decoration: BoxDecoration(
                          color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                        color: Color(0x44FF5963),
                        width: 1,
                      )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8,right: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Select option"),
                          Spacer(),
                          Icon(Icons.keyboard_arrow_down_sharp)
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
