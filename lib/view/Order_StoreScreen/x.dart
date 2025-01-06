// import 'package:eatfit_delivery_partner/helper/helperClass.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
//
// import '../../app_components/delivery_pickup_detail.dart';
// import '../../Model/OrderStoerModel/list_data.dart';
// import '../../provider/GlobalProvide/OrderList/getAllOrdersNotifier.dart';
// import '../../provider/GlobalProvide/OrderList/particularDeliveryItemNotifier.dart';
// import 'order_deilver address.dart';
// import 'order_detailed_view.dart';
//
// class OrderListContainer extends StatefulWidget {
//
//   //final OrderData orderData;
//
//   const OrderListContainer({super.key});
//
//   @override
//   State<OrderListContainer> createState() => _OrderListContainerState();
// }
//
// class _OrderListContainerState extends State<OrderListContainer> {
//
//   bool isExpand = false;
//
//   void _isExpanded(){
//     setState(() {
//       isExpand = !isExpand;
//     });}
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     WidgetsBinding.instance.addPostFrameCallback((_){
//       Provider.of<getOrders_Notifier>(context,listen: false);
//       Provider.of<getOrders_Notifier>(context,listen: false).getAllOrders(deliveryPersonId: 0);
//       //Provider.of<GetParticularDeliveryItem>(context,listen: false);
//       //Provider.of<GetParticularDeliveryItem>(context,listen: false).getDeliveryItem(deliveryPersonId: Helper.deliveryPersonId, orderId: Helper.orderId);
//     });
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//
//     return Consumer<getOrders_Notifier>(
//         builder: (context,getOrders,child){
//
//           return ListView.builder(
//               itemCount: getOrders.orderModel?.data?.length,
//               itemBuilder: (context,index) {
//
//                 return Material(
//                   elevation: 6,
//                   shadowColor: Colors.grey,
//                   child: Padding(
//                     padding: const EdgeInsets.all(24.0),
//                     child: Container(
//                       height: isExpand ? null : height*0.1,
//                       //width: 220,
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(12)
//                       ),
//                       child: Padding(
//                         padding: EdgeInsets.all(16),
//                         child: Stack(
//                           children: [
//                             AnimatedSize(
//                               duration: Duration(milliseconds: 300),
//                               //curve: Curves.easeInOut,
//                               child: Container(
//                                   margin: EdgeInsets.only(bottom: 20),
//                                   width: 365,
//                                   height: isExpand ? null : 83,
//                                   decoration: BoxDecoration(
//                                       color: Colors.white
//                                   ),
//                                   child: Column(
//                                       mainAxisAlignment: MainAxisAlignment.start,
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Row(
//                                           children: [
//                                             Padding(
//                                               padding: const EdgeInsets.only(
//                                                   top: 17, bottom: 17, left: 12),
//                                               child: Column(
//                                                 children: [
//                                                   Text("Ordr No."),
//                                                   Text("# ${getOrders.orderModel?.data?[index].orderId.toString()}"),
//                                                 ],
//                                               ),
//                                             ),
//
//                                             Padding(padding:
//                                             EdgeInsets.only(
//                                                 top: 50,
//                                                 left: 90,
//                                                 bottom: 8),
//                                               child: Container(
//
//                                                   child: GestureDetector(
//                                                       onTap: () {
//                                                         setState(() {
//                                                           isExpand = !isExpand;
//                                                         });
//                                                       },
//                                                       child: isExpand ? Icon(
//                                                           Icons.keyboard_arrow_up_sharp) : Icon(
//                                                           Icons.keyboard_arrow_down_sharp))),
//                                             ),
//
//                                             Spacer(),
//
//                                             Padding(
//
//                                               padding: const EdgeInsets.only(
//                                                   right: 17, top: 26, bottom: 26),
//                                               child: Container(
//                                                   decoration: BoxDecoration(
//                                                     //color: getColor(widget.orderData.status),
//                                                       borderRadius: BorderRadius.all(
//                                                           Radius.circular(6)
//                                                       )
//                                                   ),
//                                                   child: Text(getOrders.orderModel?.data?[index].orderStatus ?? "",
//                                                     style: GoogleFonts.istokWeb(
//                                                         fontSize: 14,
//                                                         color: gettextColor(getOrders.orderModel?.data?[index].orderStatus ?? "")
//                                                     ),)),
//                                             )
//                                           ],
//                                        ),
//                                         if(isExpand)...[OrderDetailedView(
//                                           orderId: getOrders.orderModel?.data?[index].orderId ?? 0,
//                                         ),
//                                           SizedBox(height: 16),
//                                           OrderDeliveryAddress(orderId: getOrders.orderModel?.data?[index].orderId ?? 0),
//                                           SizedBox(height: 16),
//                                           Padding(
//                                             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                                             child: DeliveryPickupDetail(),
//                                           ),
//
//                                           SizedBox(height: 16),
//                                           Padding(
//                                             padding: const EdgeInsets.only(bottom: 24),
//                                             child: clickableButton(),
//                                           ),
//                                         ],
//                                       ])
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               });
//         }
//     );
//   }
  //),
  // );
  //}
//
//   Color? getColor(String status){
//     status = status.toLowerCase();
//     switch(status){
//       case 'delivery pending':
//         return Color(0x33FF5963);
//       case 'pickup pending':
//         return Color(0x33FF5963);
//       case 'pickup failed':
//         return Color(0x33FC5862);
//       case 'delivery failed':
//         return Color(0x33FC5862);
//       case 'pickup rescheduled':
//         return Color(0x3397C8FF);
//       case 'delivery reschedule':
//         return Color(0x3397C8FF);
//       case 'delivered':
//         return Color(0x3396FFB2);
//     };
//   }
//
//   Color? gettextColor(String status){
//     status = status.toLowerCase();
//     switch(status){
//       case 'delivery pending' && 'pickup pending' && 'pickup failed' && 'delivery failed':
//         return Color(0xFFE81F2B);
//       case 'pickup rescheduled' && 'delivery reschedule':
//         return Color(0xFF0050AA);
//       case 'delivered':
//         return Color(0xFF34A853);
//     };
//   }
//
//   Center clickableButton(){
//     return Center(
//       child: Container(
//         //constraints: ,
//         width: 300,//WidthSize * 0.9,
//         height: 52,//HeightSize * 0.07,
//         child: ElevatedButton(
//           onPressed: () {
//             // Add your button action here
//             // context.push('');
//           },
//           style: ElevatedButton.styleFrom(
//             backgroundColor: const Color(0xFFFF5963), // Button color
//             padding: const EdgeInsets.symmetric(
//               horizontal: 50,
//               vertical: 15,
//             ),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(30), // Rounded edges
//             ),
//           ),
//
//           child: Text(
//             "Confirm Pickup",
//             style: GoogleFonts.inter(
//               fontSize: 16,// WidthSize*0.05,
//               color: Colors.white,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
//
// // Widget build(BuildContext context) {
// //   return Stack(
// //     children: [
// //       AnimatedSize(
// //         duration: Duration(milliseconds: 300),
// //         //curve: Curves.easeInOut,
// //         child: Container(
// //           margin: EdgeInsets.only(bottom: 20),
// //           width: 365,
// //           height: isExpand ? null : 83,
// //           decoration: BoxDecoration(
// //               color: Colors.white
// //           ),
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.start,
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Row(
// //                 children: [
// //                   Padding(
// //                     padding: const EdgeInsets.only(top: 17,bottom: 17,left: 12),
// //                     child: Column(
// //                       children: [
// //                         Text("Ordr No."),
// //                         Text("# ${widget.orderData.orderNumber.toString()}"),
// //
// //                       ],
// //                     ),
// //                   ),
// //
// //                   Padding(padding:
// //                   EdgeInsets.only(
// //                       top: 50,
// //                       left: 90,
// //                       bottom: 8),
// //                     child: Container(
// //
// //                         child: GestureDetector(
// //                             onTap: (){setState(() {
// //                               isExpand = !isExpand;
// //                             });},
// //                             child: isExpand? Icon(Icons.keyboard_arrow_up_sharp) : Icon(Icons.keyboard_arrow_down_sharp))),
// //                   ),
// //
// //                   Spacer(),
// //
// //                   Padding(
// //
// //                     padding: const EdgeInsets.only(right: 17,top: 26,bottom: 26),
// //                     child: Container(
// //                         decoration: BoxDecoration(
// //                             color: getColor(widget.orderData.status),
// //                             borderRadius: BorderRadius.all(
// //                                 Radius.circular(6)
// //                             )
// //                         ),
// //                         child: Text(widget.orderData.status,
// //                           style: GoogleFonts.istokWeb(
// //                               fontSize: 14,
// //                               color: gettextColor(widget.orderData.status)
// //                           ),)),
// //                   )
// //                 ],
// //               ),
// //               if(isExpand)...[OrderDetailedView(
// //                 orderDataa: widget.orderData,
// //               ),
// //                 SizedBox(height: 16),
// //                 OrderDeliveryAddress(orderDataa: widget.orderData,),
// //                 SizedBox(height: 16),
// //                 Padding(
// //                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
// //                   child: DeliveryPickupDetail(),
// //                 ),
// //
// //                 SizedBox(height: 16),
// //                 Padding(
// //                   padding: const EdgeInsets.only(bottom: 24),
// //                   child: clickableButton(),
// //                 ),
// //               ],
// //             ],
// //           ),
// //         ),
// //       ),
// //     ],
// //   );
// // }
//
//
// // Widget build(BuildContext context) {
// //
// //   // return ListView.builder(
// //   //     itemBuilder: (context,index) {
// //   return Consumer<getOrders_Notifier>(
// //       builder: (value,getOrders,child){
// //
// //         if(getOrders.orderModel?.data == null || getOrders.orderModel!.data!.isEmpty){
// //           return Center(
// //             child: Text('No orders available'),
// //           );
// //         }
// //         return ListView.builder(
// //           itemBuilder: (context,index) =>
// //               Stack(
// //                   children: [
// //                     AnimatedSize(
// //                       duration: Duration(milliseconds: 300),
// //                       //curve: Curves.easeInOut,
// //                       child: Container(
// //                           margin: EdgeInsets.only(bottom: 20),
// //                           width: 365,
// //                           height: isExpand ? null : 83,
// //                           decoration: BoxDecoration(
// //                               color: Colors.white
// //                           ),
// //                           child: Column(
// //                             mainAxisAlignment: MainAxisAlignment.start,
// //                             crossAxisAlignment: CrossAxisAlignment.start,
// //                             children: [
// //                               Row(
// //                                 children: [
// //                                   Padding(
// //                                     padding: const EdgeInsets.only(
// //                                         top: 17, bottom: 17, left: 12),
// //                                     child: Column(
// //                                       children: [
// //                                         Text("Ordr No."),
// //                                         Text("# ${getOrders.orderModel?.data?[index].orderId.toString()}"),
// //                                       ],
// //                                     ),
// //                                   ),
// //
// //                                   Padding(padding:
// //                                   EdgeInsets.only(
// //                                       top: 50,
// //                                       left: 90,
// //                                       bottom: 8),
// //                                     child: Container(
// //
// //                                         child: GestureDetector(
// //                                             onTap: () {
// //                                               setState(() {
// //                                                 isExpand = !isExpand;
// //                                               });
// //                                             },
// //                                             child: isExpand ? Icon(
// //                                                 Icons.keyboard_arrow_up_sharp) : Icon(
// //                                                 Icons.keyboard_arrow_down_sharp))),
// //                                   ),
// //
// //                                   Spacer(),
// //
// //                                   Padding(
// //
// //                                     padding: const EdgeInsets.only(
// //                                         right: 17, top: 26, bottom: 26),
// //                                     child: Container(
// //                                         decoration: BoxDecoration(
// //                                           //color: getColor(widget.orderData.status),
// //                                             borderRadius: BorderRadius.all(
// //                                                 Radius.circular(6)
// //                                             )
// //                                         ),
// //                                         child: Text(getOrders.orderModel?.data?[index].orderStatus ?? "",
// //                                           style: GoogleFonts.istokWeb(
// //                                               fontSize: 14,
// //                                               color: gettextColor(getOrders.orderModel?.data?[index].orderStatus ?? "")
// //                                           ),)),
// //                                   )
// //                                 ],
// //                               ),
// //                               // if(isExpand)...[OrderDetailedView(
// //                               //   orderDataa: widget.orderData,
// //                               // ),
// //                               SizedBox(height: 16),
// //                               //OrderDeliveryAddress(orderDataa: widget.orderData,),
// //                               SizedBox(height: 16),
// //                               Padding(
// //                                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
// //                                 child: DeliveryPickupDetail(),
// //                               ),
// //
// //                               SizedBox(height: 16),
// //                               Padding(
// //                                 padding: const EdgeInsets.only(bottom: 24),
// //                                 child: clickableButton(),
// //                               ),
// //                             ],
// //                           )
// //                       ),
// //                     ),
// //                   ]
// //               ),
// //         );
// //       }
// //   );
// // }
