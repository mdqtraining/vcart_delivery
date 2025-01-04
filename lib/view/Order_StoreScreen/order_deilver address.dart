import 'package:eatfit_delivery_partner/util/asset/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../Model/OrderStoerModel/list_data.dart';

class OrderDeliveryAddress extends StatefulWidget {

  final int orderId;
  const OrderDeliveryAddress({super.key,required this.orderId});

  @override
  State<OrderDeliveryAddress> createState() => _OrderDeliveryAddressState();
}

class _OrderDeliveryAddressState extends State<OrderDeliveryAddress> {
  @override
  Widget build(BuildContext context) {
      return Container(
        margin: EdgeInsets.only(left: 16,right: 24),
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(staticIcons.Vector),
                Text("Delivery"),
                Spacer(),
                SvgPicture.asset(staticIcons.share)
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45),
              //child: Text(widget.orderDataa.delivery_address ?? ""),
            ),

            SizedBox(height: 16,),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8,right: 8,),
                  child: SvgPicture.asset(staticIcons.money),
                ),
                //Text(widget.orderDataa.product_amount.toString()),
                SizedBox(width: 16),
                Padding(
                  padding: const EdgeInsets.only(left: 8,right: 8,),
                  child: SvgPicture.asset("assets/svg_icons/paidmark.svg_icons"),
                ),
                Text("Paid")
              ],
            )
          ],
        ),
      );
  }
}

