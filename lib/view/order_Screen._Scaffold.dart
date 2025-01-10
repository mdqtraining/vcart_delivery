import 'package:eatfit_delivery_partner/view/Order_StoreScreen/delivery_Item_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:weekly_date_picker/weekly_date_picker.dart';
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

  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  int _selectedTab = 0;
  bool _calenderButtonClicked = false;
  String selectedItem = "pending";

  void calenderButtonClicked(value){
    setState(() {
      _calenderButtonClicked = value;
    });
  }

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
      body: Column(
        //mainAxisSize: MainAxisSize.max,
        children: [
          
          AnimatedContainer(
            duration: Duration(seconds: 1),
            curve: Curves.easeInOut,
            height: _calenderButtonClicked ? 135 : 0.0, // Toggle height
            child: _calenderButtonClicked ? scrollableCalender() : null,
          ),

          Flexible(
            child: Container(
              margin: EdgeInsets.only(left: 16,right: 16,top: 0),
              child: Column(
                children: [

                  SizedBox(height: 16),
                  Row(
                    children: [
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

                  Flexible(
                    //fit: FlexFit.loose,
                    child: _selectedTab == 0
                     ? maelPage() // Display Meal page content
                     : storePage(),)
                ],
              ) ,
            ),
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
        child: MealBody(),
    );
  }
  Widget calender(){
    DateTime selectedDate = DateTime.now();
    return GestureDetector(
      onTap: () async{
        if(_calenderButtonClicked == false) {
          calenderButtonClicked(true);
        }else{
          calenderButtonClicked(false);
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

    return Container(
      child: TableCalendar(
        focusedDay: _focusedDay,
        //currentDay: DateTime.now(),
        firstDay: DateTime.now().subtract(Duration(days: 7)),
        lastDay: DateTime.now().add(Duration(days: 7)),
        calendarFormat: CalendarFormat.week,
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
        ),

        selectedDayPredicate: (day) {
          // Highlight the selected day
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = selectedDay;
          });
          print(_selectedDay);
        },
        calendarStyle: CalendarStyle(
          selectedDecoration: BoxDecoration(color: Colors.black)
        ),
      )
    );
  }

  Widget deliveryStatusFilter(){
    return PopupMenuButton(
        color: Colors.white,

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
              child: Text("delivery pending")),

          PopupMenuItem(
              value: 'Out for Pickup',
              child: Text("pickup pending")),

          PopupMenuItem(
              value: 'Delivery Failed',
              child: Text("failed delivery")),

          PopupMenuItem(
              value: 'Delivery Rescheduled',
              child: Text("delivery rescheduled")),

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
          Provider.of<getOrders_Notifier>(context,listen: false)
              .getAllOrders(deliveryPersonId: deliveryPersonId ?? 0,orderStatus: value);
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
        ]
    );
  }
}



