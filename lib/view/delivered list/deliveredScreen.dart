import 'package:eatfit_delivery_partner/Model/Orders/delivered_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../provider/GlobalProvide/OrderList/getAllOrdersNotifier.dart';

class DeliveredList extends StatefulWidget {

  const DeliveredList({super.key});

  @override
  State<DeliveredList> createState() => _DeliveredListState();
}

class _DeliveredListState extends State<DeliveredList> {

  @override
  void initState() {

    super.initState(); // Always call super.initState first
    print("Initializing Delivery App...");

    // Using WidgetsBinding to safely perform async calls after widget build
    WidgetsBinding.instance.addPostFrameCallback((_) async {

        final deliveryPersonId = await _getDeliveryPersonId(); // Fetch Delivery Person ID
        print("Retrieved DeliveryPersonId: $deliveryPersonId");

        // Fetch orders
        final getOrdersNotifier = Provider.of<getOrders_Notifier>(context, listen: false);
        await getOrdersNotifier.getAllOrders(deliveryPersonId: deliveryPersonId);
    });
  }

// Fetch deliveryPersonId from SharedPreferences
  Future<int> _getDeliveryPersonId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final deliveryPersonId = prefs.getInt("deliveryPersonId");

    if (deliveryPersonId == null) {
      throw Exception("DeliveryPersonId is not set in SharedPreferences");
    }
    return deliveryPersonId;
  }

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Consumer<getOrders_Notifier>(
        builder: (context, getOrders, child) {
          print(":::::::::delivered orders::::::::;;");
          print(getOrders.deliveredData?.data);

          List<bool> isExpanded =getOrders.isExpanded;
          //final List<DeliveredData>? listData  = getOrders.deliveredData?.data;
          final List<DeliveredOrderedProduct>? listData = getOrders.deliveredData?.data;
          if(listData == null) {
            return Center
              (child: CircularProgressIndicator());
          }else if(isExpanded.length == 0){
            return Center();
          }
          else {
            return ListView.builder(
                itemCount: listData.length,
                itemBuilder: (context, index) {
                  final orderData = listData[index];

                  print(":::::::::delivered data:::::::::::");
                  print(orderData.orderStatus);
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: InkWell(

                    onTap: () {
                      setState(() {
                        isExpanded[index] = !isExpanded[index];
                      });
                    },

                    child: Material(
                      surfaceTintColor: Colors.pink,
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(12),
                      elevation: 4,
                      shadowColor: Colors.grey,
                      child: Stack(
                        children: [
                          Container(
                              //width: width*0.9,
                              height: isExpanded[index] ? null : 83,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 17, bottom: 17, left: 12),
                                          child: Column(
                                            children: [
                                              Text("Ordr No."),
                                              Text("# ${orderData.orderId.toString()}"),
                                            ],
                                          ),
                                        ),

                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 17, top: 26, bottom: 26),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  color: Color(0x3397C8FF),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(6))),
                                              child: Text(orderData
                                                        .orderStatus,
                                                style: GoogleFonts.istokWeb(
                                                  fontSize: 14,
                                                ),
                                              )),
                                        )
                                      ],
                                    ),
                                    // isExpanded[index]
                                    //     ? expanded(
                                    //         orderId: listData[index].orderId)
                                    //     : SizedBox.shrink()
                                  ])),
                        ],
                      ),
                    ),
                  ),
                );

            });
          }
        }
    );
  }

//   Widget expanded({required int orderId,}){   //required String orderStatus
//     return Column(
//       children: [
//
// //DeliveredList(orderId: orderId,),
//         SizedBox(height: 16),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 //margin: EdgeInsets.only(left: 24),
//                 child:Container(
//                   //margin: EdgeInsets.all(16),
//                   height: 170,
//                   width: 328,
//
//                   decoration: BoxDecoration(
//                       color:  Color(0x33FF5963),
//                       borderRadius: BorderRadius.all(Radius.circular(10))
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       // mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text("Delivery Pickup By",
//                                   style: GoogleFonts.inter(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w400,
//                                     color: Color(0xFFFF5963),
//                                   ),),
//                                 Text("Tommorow",
//                                   style: GoogleFonts.istokWeb(
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.w400,
//                                       color: Color(0xFF57585A)
//                                   ),),
//                                 Text("5:30 PM, Thu, 25/08/2023",
//                                   style: GoogleFonts.istokWeb(
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.w400,
//                                       color: Color(0xFF57585A)
//                                   ),)
//                               ],
//                             ),
//                             Spacer(),
//                             //SizedBox(width: 2,)
//                             Container(
//                               height: 62,
//                               width: 113,
//                               margin: EdgeInsets.all(4),
//                               decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.all(Radius.circular(10))
//                               ),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 4),
//                                     child: Row(children: [
//                                       SvgPicture.asset("assets/svg_icons/clock.svg_icons"),
//                                       Text("TIME LEFT",
//                                         style: GoogleFonts.inter(
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w600,
//                                             color: Color(0xFFFF5963)
//                                         ),)
//                                     ],),
//                                   ),
//
//                                   Text("1:04 Hrs",
//                                     style: GoogleFonts.inter(
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w400,
//                                         color: Colors.black
//                                     ),)
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                         SizedBox(height: 16),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             Text("Update Status",
//                               style: GoogleFonts.inter(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.bold,
//                                   color: Color(0xFFFF5963)
//                               ),),
//
//                             Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Container(
//                                         height: 50,
//                                         width: 180,
//                                         decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.circular(12),
//                                           color: Colors.white,
//                                         ),
//                                         child: Padding(
//                                           padding: const EdgeInsets.only(left: 24.0),
//                                           child: DropdownButton<String>(
//                                             value: selectedValue, // The currently selected value
//                                             hint: Text("Select"), // Hint when no value is selected
//                                             underline: SizedBox(), // Removes the default underline
//                                             icon: Icon(Icons.arrow_drop_down, color: Colors.blueAccent), // Dropdown icon
//                                             isExpanded: true, // Ensures the dropdown takes full width
//                                             items: status.map((String value) {
//                                               return DropdownMenuItem<String>(
//                                                 value: value, // Each item's unique value
//                                                 child: Text(value), // Display the value
//                                               );
//                                             }).toList(),
//                                             onChanged: (String? newValue) async{
//
//                                               final SharedPreferences prefs = await SharedPreferences.getInstance();
//                                               final deliverypersonId = prefs.getInt('deliveryPersonId');
//
//                                               selectedValue = newValue;
//                                               setState(() {
//                                                 selectedValue = newValue; // Update the selected value
//                                               });
//                                               print(deliverypersonId);
//                                               //print(pickData[index].orderId);
//                                               print(statusId(selectedValue ?? ""));
//
//                                               //.getAllOrders(deliveryPersonId: deliverypersonId ?? 0);
//                                             },
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ]
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//
//               SizedBox(height: 16),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () async {
//
//                       final SharedPreferences prefs = await SharedPreferences.getInstance();
//                       final deliverypersonId = prefs.getInt('deliveryPersonId');
//
//
//                       await Provider.of<getOrders_Notifier>(context,listen: false).updateStatusNotifier(
//                           deliveryPersonId: deliverypersonId ?? 0, orderID: orderId ?? 0, orderStatus: statusId(selectedValue ?? "") ?? 0);
//
//                       await Provider.of<getOrders_Notifier>(context,listen: false).getAllOrders(deliveryPersonId: deliverypersonId ?? 0);
//                     },
//
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor : Color(0xFFFF5963), // Button color
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 50,
//                         vertical: 15,
//                       ),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30), // Rounded edges
//                       ),
//                     ),
//                     child:
//                     Text(
//                       "Confirm",
//                       style: GoogleFonts.inter(
//                         fontSize: 18, // WidthSize*0.05,
//                         color: Colors.white,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         //Button needs to placed......
//       ],
//     );
//   }

  // String? selectedValue;
  // List<String> status = [
  //   "Out for Pickup",
  //   "Out For Delivery",
  //   "Failed Delivery Attempt",
  //   "Delivered",
  //   "Delivery Failed",
  //   "Address Issue",
  //   "Delivery Rescheduled"];
  //
  //
  // int? statusId(String status){
  //   status = status.toLowerCase();
  //   switch(status){
  //     case 'out for pickup':
  //       return 16;
  //     case 'out for delivery':
  //       return 17;
  //     case 'failed delivery attempt':
  //       return 18;
  //     case 'delivered':
  //       return 19;
  //     case 'delivery failed':
  //       return 20;
  //     case 'address issue':
  //       return 21;
  //     case 'delivery rescheduled':
  //       return 22;
  //   };
  // }
  //
  // Color? getColor(String status){
  //   status = status.toLowerCase();
  //   switch(status){
  //     case 'out for pickup':
  //       return Color(0x33FF5963);
  //     case 'delivery reschedule':
  //       return Color(0x33FC5862);
  //     case 'failed delivery attempt':
  //       return Color(0x33FC5862);
  //     case 'delivery Failed':
  //       return Color(0x33FC5862);
  //     case 'delivery rescheduled':
  //       return Color(0x33FC5862);
  //     case 'delivered':
  //       return Color(0x3397C8FF);
  //     case 'out for delivery':
  //       return Color(0x3397C8FF);
  //     case 'pending':
  //       return Color(0x3397C8FF);
  //   };
  // }
}




// return Column(
// children: [
// ElevatedButton(onPressed: (){
// Provider.of<GetParticularDeliveryItem>(context,listen: false)
//     .getDeliveryItem(deliveryPersonId: Helper.deliveryPersonId,
// orderId: getOrders.orderModel?.data?[0].orderId ?? 0);
// }, child: Text("click here")),
//
// ElevatedButton(onPressed: (){
// Provider.of<ParticularPickupItemNotifier>(context, listen: false)
//     .getPickupData(deliveryPersonId: Helper.deliveryPersonId);
//    }, child: Text("click again")),
//  ],
// );