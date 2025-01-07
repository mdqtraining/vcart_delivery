import 'package:eatfit_delivery_partner/util/asset/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../app_components/delivery_pickup_detail.dart';
import '../../provider/GlobalProvide/OrderList/getAllOrdersNotifier.dart';
import '../../provider/GlobalProvide/OrderList/particularPickupItemNotifier.dart';
import 'extended_content.dart';
import '../../Model/OrderMealModel/meal_page_model.dart';

class MealBody extends StatefulWidget {

  const MealBody({super.key});

  @override
  State<MealBody> createState() => _MealBodyState();
}

class _MealBodyState extends State<MealBody> {

  @override
  void initState() {
    super.initState();

    try{
      WidgetsBinding.instance.addPostFrameCallback((_) async{
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          final deliveryPersonId = prefs.getInt("deliveryPersonId");

          final getProducts = Provider.of<ParticularPickupItemNotifier>(context, listen: false);
          await getProducts.getPickupData(deliveryPersonId: deliveryPersonId ?? 0);

          final ordersCount = getProducts.particularPickupData?.data?.length;
          print("Number of Orders: $ordersCount");

          setState(() {
            isExpanded = List.generate(ordersCount!, (_) => false);
          });
        });
       }catch(e){
      print(e);
    }
  }

  List<bool> isExpanded = [];

  int? selectedNumber;

  @override
  Widget build(BuildContext context) {

    return Consumer<ParticularPickupItemNotifier>(
      builder: (context,getOrders,child){

        final pickData = getOrders.particularPickupData?.data;
        if(pickData == null || pickData.isEmpty){
          return Center(
            child: Text('No orders available'),
          );
        }else if(isExpanded.length ==0){
          return Center(child: CircularProgressIndicator());
        }
        print(pickData.isEmpty);
        return ListView.builder(
          itemCount: pickData.length,
          itemBuilder: (context,index) {

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 8),
              child: Material(
                shadowColor: Colors.grey,
                elevation: 4,
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  //margin: EdgeInsets.symmetric(horizontal: 0, vertical: 12),
                  width: 360,
                  height: isExpanded[index] ? null : 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(pickData[index].shopName ?? ""),
                            Spacer(),
                            GestureDetector(
                                onTap: (){launch('tel: ${pickData[index].contactNumber}');},
                                child: SvgPicture.asset(staticIcons.call)),
                            SizedBox(width: 8),
                            SvgPicture.asset(staticIcons.share),
                          ],
                        ),
                      ),

                      Divider(
                        thickness: 1,
                        indent: 0,
                        endIndent: 0,
                        color: Color(0xFF4A5568),
                      ),

                          InkWell(
                            onTap: () {
                              setState(() {
                                isExpanded[index] =
                                !isExpanded[index];
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 4),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text("OrderId  :  "),
                                          Text(pickData[index].orderId.toString()),
                                        ],
                                      ),
                                        //Text("${}| ${widget.mealModel.Time} PM"),
                                    ],
                                  ),
                                  Spacer(),
                                  Container(
                                    decoration: BoxDecoration(color: getColor(
                                        pickData[index].orderStatus ?? "")),
                                    child: Text(pickData[index].orderStatus ?? "",
                                      style: GoogleFonts.istokWeb(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14,
                                          color: gettextColor(
                                              pickData[index].orderStatus ?? "")
                                      ),),
                                  ),
                                ],
                              ),
                            ),
                          ),

                      isExpanded[index] ? Column(
              children: [

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
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
                            child: Text(pickData[index].sellerAddress ?? ""),),

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
                          //Order delivery Detail........
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                            //margin: EdgeInsets.only(left: 24),
                            child:Container(
                            //margin: EdgeInsets.all(16),
                            height: 170,
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

                                        Row(
                                          children: [
                                            Container(
                                              height: 50,
                                              width: 180,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(12),
                                                color: Colors.white,
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 24.0),
                                                child: DropdownButton<String>(
                                                  value: selectedValue, // The currently selected value
                                                  hint: Text("Select"), // Hint when no value is selected
                                                  underline: SizedBox(), // Removes the default underline
                                                  icon: Icon(Icons.arrow_drop_down, color: Colors.blueAccent), // Dropdown icon
                                                  isExpanded: true, // Ensures the dropdown takes full width
                                                  items: status.map((String value) {
                                                    return DropdownMenuItem<String>(
                                                      value: value, // Each item's unique value
                                                      child: Text(value), // Display the value
                                                    );
                                                  }).toList(),
                                                  onChanged: (String? newValue) {
                                                    setState(() {
                                                      selectedValue = newValue; // Update the selected value
                                                    });
                                                    Provider.of<getOrders_Notifier>(context,listen: false).updateStatusNotifier(
                                                        deliveryPersonId: 1, orderID: 1, orderStatus: 19);

                                                    Provider.of<getOrders_Notifier>(context,listen: false);
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),

                                        //DropdownMenu(dropdownMenuEntries: dropdownMenuEntries)

                              //             Center(
                              //                   child: DropdownButton<String>(
                              //                     value: _selectedStatus, // Current value
                              //                      items: _orderStatus.map((String status) {
                              //                       return DropdownMenuItem<String>(
                              //         value: status,
                              //         child: Text(status),
                              //       );
                              //     }).toList(),
                              //     onChanged: (String? newValue) {
                              //       setState(() {
                              //         _selectedStatus = newValue!;
                              //       });
                              //     },
                              //     underline: Container(
                              //       height: 2,
                              //       color: Colors.blueAccent,
                              //     ),
                              //     dropdownColor: Colors.white,
                              //   ),
                              // ),

                                        // Container(
                                        //   height: 32,
                                        //   width: 165,
                                        //   decoration: BoxDecoration(
                                        //       color: Colors.white,
                                        //       borderRadius: BorderRadius.all(Radius.circular(10)),
                                        //       border: Border.all(
                                        //         color: Color(0x44FF5963),
                                        //         width: 1,
                                        //       )
                                        //             ),
                                        //            child: Padding(
                                        //               padding: const EdgeInsets.only(left: 8,right: 8),
                                        //               child: Row(
                                        //                 mainAxisAlignment: MainAxisAlignment.center,
                                        //                 children: [
                                        //                           Text("Select option"),
                                        //                           Spacer(),
                                        //                           Icon(Icons.keyboard_arrow_down_sharp)
                                        //                         ],
                                        //                     ),
                                        //                   ),
                                        //                 )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  //Button needs to placed......
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ) : SizedBox.shrink()
                    ],
                  ),
                ),
              ),
            );
          }
        );
      } //: CircularProgressIndicator()
    );
  }

 String? selectedValue;
  List<String> status = ["Out for Pickup",
    "Out For Delivery",
    "Failed Delivery Attempt",
    "Delivered",
    "Delivery Failed",
    "Address Issue",
    "Delivery Rescheduled"];

  Color? getColor(String status){
    status = status.toLowerCase();
    switch(status){
      case 'pickup pending':
        return Color(0x33FF5963);
      case 'pickup failed':
        return Color(0x33FC5862);
      case 'delivery pending':
        return Color(0x33FC5862);
      case 'delivery failed':
        return Color(0x33FC5862);
      case 'pickup rescheduled':
        return Color(0x3397C8FF);
      case 'delivery reschedule':
        return Color(0x3397C8FF);
    };
  }


  Color? gettextColor(String status){
    status = status.toLowerCase();
    switch(status){
      case 'delivery pending' && 'pickup pending' && 'pickup failed' && 'delivery failed':
        return Color(0xFFE81F2B);
      case 'pickup rescheduled' && 'delivery reschedule':
        return Color(0xFF0050AA);
    };
  }
}
