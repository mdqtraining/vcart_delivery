import 'package:eatfit_delivery_partner/util/asset/image%20assest.dart';
import 'package:eatfit_delivery_partner/view/Order_StoreScreen/delivery_Item_list.dart';
import 'package:flutter/material.dart';
import '../Model/OrderMealModel/meal_page_model.dart';
import '../Model/OrderStoerModel/list_data.dart';
import '../app_components/datePicker.dart';
import '../app_components/tab_bar.dart';
import '../app_components/topAppBar.dart';
import 'Order_MealScreen/meal_body.dart';

class HomeScreenStore1 extends StatefulWidget {

   HomeScreenStore1({super.key});

  @override
  State<HomeScreenStore1> createState() => _HomeScreenStore1State();
}

class _HomeScreenStore1State extends State<HomeScreenStore1> {

  final orderdata = OrderData.order_Data_set();

  int _selectedTab = 0;

  void _onTabSelected(int index) {
          setState(() {
          _selectedTab = index;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE8E8E8),
      appBar: CommonAppBar(lead: false),
      body: Container(
        margin: EdgeInsets.only(left: 16,right: 16,top: 24),
        child: Column(
          children: [
            Row(
              children: [

                Container(
                    child: TabBarCustom(onTabSelected: _onTabSelected,)),
                Spacer(),
                DatePickingContainer()
              ],
            ),
            SizedBox(height: 12,),
            Expanded(
              child: _selectedTab == 0
               ? maelPage() // Display Meal page content
               : storePage(),)

          ],
        ) ,
      ),

    );
  }

  Container storePage(){
    return Container(
        child: OrderListContainer()
    );
  }

Container maelPage(){
    return Container(

        child: MealBody()
    );
  }
}

