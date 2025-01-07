import 'package:eatfit_delivery_partner/Model/Orders/orders_getall.dart';
import 'package:eatfit_delivery_partner/helper/helperClass.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../app_components/delivery_pickup_detail.dart';
import '../../provider/GlobalProvide/OrderList/getAllOrdersNotifier.dart';

import 'order_detailed_view.dart';

class OrderListContainer extends StatefulWidget {

  const OrderListContainer({super.key});

  @override
  State<OrderListContainer> createState() => _OrderListContainerState();
}

class _OrderListContainerState extends State<OrderListContainer> {

  //List<bool> isExpanded = [];

  @override
  void initState() {
    super.initState(); // Always call super.initState first
    print("Initializing Delivery App...");

    // Using WidgetsBinding to safely perform async calls after widget build
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        final deliveryPersonId = await _getDeliveryPersonId(); // Fetch Delivery Person ID
        print("Retrieved DeliveryPersonId: $deliveryPersonId");

        // Fetch orders
        final getOrdersNotifier = Provider.of<getOrders_Notifier>(context, listen: false);
        await getOrdersNotifier.getAllOrders(deliveryPersonId: deliveryPersonId);

        // Initialize toggle states (isExpanded list)
        //final ordersCount = getOrdersNotifier.orderModel?.data?.length ?? 0;
        //print("Number of Orders: $ordersCount");

        // setState(() {
        //   isExpanded = List.generate(ordersCount, (_) => false);
        // });
      } catch (e) {
        print("Error in initState: $e");
      }
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
    //print(isExpanded);

    //print("The expanded checing $_isExpand");
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Consumer<getOrders_Notifier>(
        builder: (context, getOrders, child) {

          List<bool> isExpanded =getOrders.isExpanded;
          final List<OrderedProduct>? listData  = getOrders.orderModel?.data;
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

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                                  color: Colors.white
                              ),
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
                                              Text("# ${orderData.orderId
                                                  .toString()}"),
                                            ],
                                          ),
                                        ),

                                        Padding(padding:
                                        EdgeInsets.only(
                                            top: 50,
                                            left: 90,
                                            bottom: 8),
                                          child: Container(

                                              child: GestureDetector(
                                                  onTap: () {
                                                    //Future.delayed(Duration(seconds: 5));
                                                    setState(() {
                                                      isExpanded[index] =
                                                      !isExpanded[index];
                                                    });
                                                  },
                                                  child: isExpanded[index]
                                                      ? Icon(
                                                      Icons
                                                          .keyboard_arrow_up_sharp)
                                                      : Icon(
                                                      Icons
                                                          .keyboard_arrow_down_sharp))),
                                        ),

                                        Spacer(),

                                        Padding(

                                          padding: const EdgeInsets.only(
                                              right: 17, top: 26, bottom: 26),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                //color: getColor(widget.orderData.status),
                                                  borderRadius: BorderRadius
                                                      .all(
                                                      Radius.circular(6)
                                                  )
                                              ),
                                              child: Text(getOrders.orderModel
                                                  ?.data?[index].orderStatus ??
                                                  "",
                                                style: GoogleFonts.istokWeb(
                                                  fontSize: 14,
                                                  //color: gettextColor(getOrders.orderModel?.data?[index].orderStatus ?? "")
                                                ),)),
                                        )
                                      ],
                                    ),
                                    isExpanded[index] ? expanded(
                                        orderId: orderData.orderId) : SizedBox
                                        .shrink()
                                  ])
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }
        }
    );
  }

  Widget expanded({required int orderId}){
    return Column(
      children: [
    //     if(isExpand)...[OrderDetailedView(
    // orderId: getOrders.orderModel?.data?[index].orderId ?? 0,
    // ),
            OrderDetailedView(orderId: orderId,),
            // SizedBox(height: 16),
            //   OrderDeliveryAddress(orderId: orderId,),
              SizedBox(height: 16),
            // Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 16.0),
            //     child: DeliveryPickupDetail(),
            // ),

            SizedBox(height: 16),
              Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                     //child: clickableButton(),
                    ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // IconButton(onPressed: (){
            //           //isExpanded(false);
            //               //_isExpand;
            //           },icon: isExpanded == false ? Icon(Icons.keyboard_arrow_up) : Icon(null)),
      ]
        )]
    );
  }
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