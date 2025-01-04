import 'package:eatfit_delivery_partner/helper/helperClass.dart';
import 'package:eatfit_delivery_partner/util/asset/animation.dart';
import 'package:eatfit_delivery_partner/util/asset/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../Model/OrderStoerModel/list_data.dart';
import '../../provider/GlobalProvide/OrderList/particularDeliveryItemNotifier.dart';

class OrderDetailedView extends StatefulWidget {

  final int orderId;

  const OrderDetailedView({super.key,required this.orderId});

  @override
  State<OrderDetailedView> createState() => _OrderDetailedViewState();
}

class _OrderDetailedViewState extends State<OrderDetailedView> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_){
      Provider.of<GetParticularDeliveryItem>(context).getDeliveryItem(
          deliveryPersonId: Helper.deliveryPersonId, orderId: widget.orderId);
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<GetParticularDeliveryItem>(
      builder: (context,getParticularItem,child) {

        // getParticularItem.particularItemData == null && getParticularItem.particularItemData?.data == null ?
        //     CircularProgressIndicator():

         return Container(

          margin: EdgeInsets.only(left: 11, top: 4, right: 26),
          //width: 357,
          color: Colors.white,
          child: Stack(
            children: [

              Column(
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 4, right: 10),
                        child: SvgPicture.asset(staticIcons.UseraltLight),
                      ),

                      Text(getParticularItem.particularItemData?.data?.customerId.toString() ?? "",
                        style: GoogleFonts.istokWeb(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Colors.black
                        ),),
                      SizedBox(width: 38,),
                      SvgPicture.asset(staticIcons.call)
                    ],
                  ),
                  SizedBox(height: 16,),
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: SvgPicture.asset(staticIcons.pickuphands),
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
                      child: SvgPicture.asset(staticIcons.call),
                    ),
                    SvgPicture.asset(staticIcons.share)
                  ],
                  ),
                  SizedBox(height: 4,),
                  Padding(padding: EdgeInsets.only(left: 45),
                    //child: Text(widget.orderDataa.pickup_address ?? ""),
                  ),

                  SizedBox(height: 22,),

                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 26.0),
                        //child: Image.asset("asset/images/order/lado.png"),
                      ),
                      SizedBox(width: 4,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //Text(widget.orderDataa.food_name ?? ""),
                          //Text(widget.orderDataa.weight.toString() ?? ""),
                          //Text("Qty: ${widget.orderDataa.quanity.toString()}")
                        ],
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        );
      }
    );
  }
}
