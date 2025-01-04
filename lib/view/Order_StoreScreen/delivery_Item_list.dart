import 'package:eatfit_delivery_partner/Model/Orders/orders_getall.dart';
import 'package:eatfit_delivery_partner/helper/helperClass.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../app_components/delivery_pickup_detail.dart';
import '../../Model/OrderStoerModel/list_data.dart';
import '../../provider/GlobalProvide/OrderList/getAllOrdersNotifier.dart';
import '../../provider/GlobalProvide/OrderList/particularDeliveryItemNotifier.dart';
import '../../provider/GlobalProvide/OrderList/particularPickupItemNotifier.dart';
import 'order_deilver address.dart';
import 'order_detailed_view.dart';

class OrderListContainer extends StatefulWidget {

  //final OrderData orderData;

  const OrderListContainer({super.key});

  @override
  State<OrderListContainer> createState() => _OrderListContainerState();
}

class _OrderListContainerState extends State<OrderListContainer> {

  bool _isExpand = false;

  void isExpanded(value) {
    setState(() {
      _isExpand = value;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<getOrders_Notifier>(context, listen: false);
      Provider.of<getOrders_Notifier>(context, listen: false).getAllOrders(deliveryPersonId: 0);

      Provider.of<ParticularPickupItemNotifier>(context, listen: false);
      Provider.of<ParticularPickupItemNotifier>(context, listen: false).getPickupData(deliveryPersonId: Helper.deliveryPersonId);

      Provider.of<GetParticularDeliveryItem>(context,listen: false);
      Provider.of<GetParticularDeliveryItem>(context,listen: false)
          .getDeliveryItem(deliveryPersonId: Helper.deliveryPersonId, orderId: Helper.orderId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Consumer<getOrders_Notifier>(
        builder: (context, getOrders, child) {
          print(getOrders.orderModel?.data);
          final List<OrderedProduct>? listData  = getOrders.orderModel?.data;
          return ListView.builder(
              itemCount: listData?.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(12),
                    elevation: 4,
                    shadowColor: Colors.grey,
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Colors.white),
                      height: _isExpand ? height*0.1 : null,
                      width: width*0.8,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Order No."),
                                    Text(listData?[index].orderId.toString() ?? "")
                                  ],
                                ),
                                //Expanded(child: Center(child: Text("hi"),)),

                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(onPressed: (){_isExpand == true;},
                                    icon: Icon(Icons.keyboard_arrow_down_sharp))
                              ],),
                            // _isExpand == true ? expanded(orderId: listData?[index].orderId) : null ,
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
        }
    );
  }
  Widget expanded({required int orderId}){
    return Column(
      children: [
    //     if(isExpand)...[OrderDetailedView(
    // orderId: getOrders.orderModel?.data?[index].orderId ?? 0,
    // ),
        OrderDetailedView(orderId: orderId),
    SizedBox(height: 16),
    OrderDeliveryAddress(orderId: orderId),
    SizedBox(height: 16),
    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: DeliveryPickupDetail(),
    ),

    SizedBox(height: 16),
    Padding(
    padding: const EdgeInsets.only(bottom: 24),
    //child: clickableButton(),
    ),
      ],
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
// }, child: Text("click again")),
// ],
// );