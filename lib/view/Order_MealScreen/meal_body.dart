import 'package:eatfit_delivery_partner/util/asset/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../provider/GlobalProvide/OrderList/getAllOrdersNotifier.dart';
import '../../provider/GlobalProvide/OrderList/particularPickupItemNotifier.dart';
import 'extended_content.dart';
import '../../Model/OrderMealModel/meal_page_model.dart';

class MealBody extends StatefulWidget {

  //final MealData mealModel;
  const MealBody({super.key});

  @override
  State<MealBody> createState() => _MealBodyState();
}

class _MealBodyState extends State<MealBody> {

  @override
  void initState() {

    super.initState();

    print("Starting........");
    try{
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        final deliveryPersonId = prefs.getInt("deliveryPersonId");

        print(deliveryPersonId);
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


  @override
  Widget build(BuildContext context) {


    return Consumer<ParticularPickupItemNotifier>(
      builder: (context,getOrders,child){
        final pickData = getOrders.particularPickupData?.data;
        if(pickData == null || pickData.isEmpty){
          return Center(
            child: Text('No orders available'),
          );
        }
        print(pickData);
        return ListView.builder(
          itemCount: pickData.length,
          itemBuilder: (context,index) {
            final firstOrder = pickData[index];

            return Container(
              margin: EdgeInsets.symmetric(horizontal: 0, vertical: 4),
              width: 360,
              height: isExpanded[index] ? null : 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(firstOrder.orderId.toString()),
                        Spacer(),
                        SvgPicture.asset(staticIcons.call),
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

                  //Orders
                  // ListView.builder(
                  //   itemCount: 2,
                  //   itemBuilder: (context,index) {
                      //child:
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
                                  Text(firstOrder.orderId.toString()),
                                  //   Text("${widget.mealModel.preference}| ${widget
                                  //       .mealModel.Time} PM"),
                                ],
                              ),
                              Spacer(),
                              Container(
                                decoration: BoxDecoration(color: getColor(
                                    firstOrder.orderStatus ?? "")),
                                child: Text(firstOrder.orderStatus ?? "",
                                  style: GoogleFonts.istokWeb(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                      color: gettextColor(
                                          firstOrder.orderStatus ?? "")
                                  ),),
                              ),
                            ],
                          ),
                        ),
                      ),

                  isExpanded[index] ? MealPageDetailedView()
                      : SizedBox.shrink()
                  // if (isExpand)
                  //   MealPageDetailedView(mealModel: firstOrder),
                ],
              ),
            );
          }
        );
      } //: CircularProgressIndicator()
    );
  }


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
