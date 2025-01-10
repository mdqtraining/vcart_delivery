import 'package:eatfit_delivery_partner/helper/helperClass.dart';
import 'package:eatfit_delivery_partner/util/asset/animation.dart';
import 'package:eatfit_delivery_partner/util/asset/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
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
    try{
      WidgetsBinding.instance.addPostFrameCallback((_) async{

        final deliveryPersonId = await _getDeliveryPersonId(); // Fetch Delivery Person ID
        print("Retrieved DeliveryPersonId: $deliveryPersonId");

        Provider.of<GetParticularDeliveryItem>(context,listen: false).getDeliveryItem(
            deliveryPersonId: deliveryPersonId, orderId: widget.orderId);
      });
    }catch(e){print("::::::::Exception in the main line:::::::::");
    print(e);}

    super.initState();
  }

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
    return Consumer<GetParticularDeliveryItem>(
      builder: (context,getParticularItem,child) {

          final particularData = getParticularItem.particularItemData?.data;
          final products = particularData?.orderedProducts;
          if(particularData == null) {
            return CircularProgressIndicator();
          }else {
            print("::::::::::::::::::::::::::::::::::::::::::::::::");
            print(getParticularItem.particularItemData?.data?.deliveryDetails?.address ?? "no data");
            print(getParticularItem.particularItemData?.data?.billingDetails?.discount ?? "no data");
            try {
              print(particularData.deliveryDetails?.deliveryStatus ?? "aaaaa");
            }catch(e){print(e);}
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
                      Text("CustomerId  :  ",
                        style: GoogleFonts.istokWeb(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black)),
                      Text(
                        particularData.customerId.toString() ?? "",
                        //getParticularItem.particularItemData?.data?.customerId.toString() ?? "",
                        style: GoogleFonts.istokWeb(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Colors.black),
                      ),
                      Spacer(),
                      GestureDetector(
                          onTap: () {
                            launch('tel: ${particularData.contactNumber}');
                          },
                          child: SvgPicture.asset(staticIcons.call))
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: SvgPicture.asset(staticIcons.pickuphands),
                      ),
                      Text(
                        "Pickup Products",
                        style: GoogleFonts.istokWeb(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 45),
                    child: Column(
                      children: List.generate(
                        products?.length ?? 0, // Ensure products list is not null
                            (index) {
                          return Row(
                            children: [
                              Text(products?[index].productId.toString() ?? ""),
                              SizedBox(width: 24,),
                              Text(products?[index].productName ?? ""),
                              SizedBox(width: 24,),
                              Text(products?[index].productQty ?? ""),
                              SizedBox(width: 24,),
                              Text(products?[index].cartQty.toString() ?? ""),
                              SizedBox(width: 24,),
                              Text(products?[index].price.toString() ?? ""),
                            ],
                          );
                        },
                      ),

                    ),
                  ),

                  SizedBox(height: 24,),
                  Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(staticIcons.Vector),
                          Text("Delivery"),
                          Spacer(),
                          SvgPicture.asset(staticIcons.share)
                        ],
                      ),
                      particularData.deliveryDetails!.address!.isNotEmpty?Text(
                         
                           particularData.deliveryDetails!.address.toString()):Text("no data"),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 8,
                              right: 8,
                            ),
                            child: SvgPicture.asset(staticIcons.money),
                          ),
                          Text(particularData.totalAmount.toString()),
                          SizedBox(width: 16),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 8,
                              right: 8,
                            ),
                            child:
                            SvgPicture.asset(staticIcons.tick),
                          ),
                          Text("Paid")
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
    }
    );
  }
}
