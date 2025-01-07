import 'package:eatfit_delivery_partner/util/asset/icons.dart';
import 'package:eatfit_delivery_partner/util/asset/image%20assest.dart';
import 'package:eatfit_delivery_partner/view/Order_StoreScreen/delivery_Item_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weekly_date_picker/weekly_date_picker.dart';
import '../Model/OrderMealModel/meal_page_model.dart';
import '../Model/OrderStoerModel/list_data.dart';
import '../app_components/datePicker.dart';
import '../app_components/tab_bar.dart';
import '../app_components/topAppBar.dart';
import '../provider/GlobalProvide/OrderList/getAllOrdersNotifier.dart';
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
  String selectedItem = "pending";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE8E8E8),
      appBar: CommonAppBar(lead: false),
      body: Column(
        mainAxisSize: MainAxisSize.min,

        children: [
          Flexible(
            fit: FlexFit.loose,
              child: scrollableCalender(),),

          Container(
            margin: EdgeInsets.only(left: 16,right: 16,top: 0),
            child: Column(
              children: [
                scrollableCalender(),
                SizedBox(height: 16),
                Row(
                  children: [
                    //Container(child: scrollableCalender()),
                    scrollableCalender(),

                    Container(
                        child: TabBarCustom(onTabSelected: _onTabSelected,)),
                    Spacer(),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white
                      ),
                      child: deliveryStatusFilter()
                    ),
                    SizedBox(width: 16),
                    //DatePickingContainer()
                    calender()
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
        ],
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
  Widget calender(){
    DateTime selectedDate = DateTime.now();
    return GestureDetector(
      onTap: () async{

        final SharedPreferences pref = await SharedPreferences.getInstance();
        final deliveryPersonId = pref.getInt('deliveryPersonId');

        final DateTime? datepicker = await showDatePicker(context: context,
            firstDate: DateTime.now().subtract(Duration(days: 7)),
            lastDate: DateTime.now().add(Duration(days: 7)),
          barrierDismissible: true,
          barrierColor: Colors.grey
        );

        if(datepicker != null){
          setState(() {
            selectedDate = datepicker;
          });
          Provider.of<getOrders_Notifier>(context,listen: false).getAllOrders(deliveryPersonId: deliveryPersonId ?? 0,dateFilter: selectedDate);
        }
      },
      child: Container(
        // margin: EdgeInsets.only(left: 6),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          color: Colors.white,
        ),
        child: Icon(Icons.calendar_month),
      ),
    );
  }


  Widget scrollableCalender(){
    DateTime _selectedDate = DateTime.now();
    return Container(
      child: Row(
        children: [
          WeeklyDatePicker(
              selectedDay: _selectedDate,
              changeDay: (value) => setState(() {
                _selectedDate =value;
              })
          ),
        ],
      ),
    );
  }

  Widget deliveryStatusFilter(){
    return PopupMenuButton(
        color: Colors.white,
        //surfaceTintColor: Colors.white,
        icon: Icon(Icons.list),
        onSelected: (value) async{

          final SharedPreferences pref = await SharedPreferences.getInstance();
          final deliveryPersonId = pref.getInt('deliveryPersonId');
          Provider.of<getOrders_Notifier>(context,listen: false).getAllOrders(deliveryPersonId: deliveryPersonId ?? 0,orderStatus: value);
        },
        itemBuilder:(BuildContext context) =>[

          PopupMenuItem(
              value: '',
              child: Text('All')),

          PopupMenuItem(
              value: 'Pending',
              child: Text("pending")),

          PopupMenuItem(
              value: 'Out For Delivery',
              child: Text("Waiting")),

          PopupMenuItem(
              value: 'Delivered',
              child: Text("Delivered")),
        ] );
  }

  Widget pickUpStatusFilter(){
    return PopupMenuButton(
        color: Colors.white,
        //surfaceTintColor: Colors.white,
        icon: Icon(Icons.list),
        onSelected: (value) async{

          final SharedPreferences pref = await SharedPreferences.getInstance();
          final deliveryPersonId = pref.getInt('deliveryPersonId');
          Provider.of<getOrders_Notifier>(context,listen: false).getAllOrders(deliveryPersonId: deliveryPersonId ?? 0,orderStatus: value);
        },
        itemBuilder:(BuildContext context) =>[

          PopupMenuItem(
              value: '',
              child: Text('All')),

          PopupMenuItem(
              value: 'Pending',
              child: Text("pending")),

          PopupMenuItem(
              value: 'Out For Delivery',
              child: Text("Waiting")),

          PopupMenuItem(
              value: 'Delivered',
              child: Text("Delivered")),
        ] );
  }
}



