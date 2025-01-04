import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../view/account_Screen_Scaffold.dart';
import '../view/order_Screen._Scaffold.dart';

class MainRouteStarts extends StatefulWidget {
  const MainRouteStarts({super.key});

  @override
  State<MainRouteStarts> createState() => _MainRouteStartsState();
}

class _MainRouteStartsState extends State<MainRouteStarts> {


  final List<Widget> ScreensList = [HomeScreenStore1(),MyAccountMain()];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index when a button is tapped
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFFE8E8E8),
      body: ScreensList[_selectedIndex],
      bottomNavigationBar: BottomNavigation(onSelectedScreen: _onItemTapped,),
    );
  }
}


class BottomNavigation extends StatefulWidget implements PreferredSizeWidget {

  final  Function(int) onSelectedScreen;
  const BottomNavigation({super.key,required this.onSelectedScreen});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _BottomNavigationState extends State<BottomNavigation> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index when a button is tapped
    });
    widget.onSelectedScreen(index);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height*0.13,
      width: width,
      margin: EdgeInsets.all(0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(26),
              topRight: Radius.circular(26)
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: (){
              _onItemTapped(0);},
            child: Container(
              margin: EdgeInsets.only(left: 28),
              height: height*0.06,
              width: width*0.40,
              decoration: BoxDecoration(
                color: _selectedIndex == 0 ?  Color(0xFFFF5963) : Colors.white,
                borderRadius: BorderRadius.all(
                    Radius.circular(5)
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset("asset/svg_icons/bag.svg",
                    color: _selectedIndex == 0 ? Colors.white: Colors.black ,),
                  SizedBox(width: 6),
                  Text("Orders",
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: _selectedIndex == 0 ? Colors.white: Colors.black,
                    ),)
                ],
              ),
            ),
          ),

          InkWell(
            onTap: (){_onItemTapped(1);},
            child: Container(
              height: height*0.06,
              width: width*0.40,
              margin: EdgeInsets.only(right: 28),
              decoration: BoxDecoration(
                color: _selectedIndex == 1 ? Color(0xFFFF5963) : Colors.white,
                borderRadius: BorderRadius.all(
                    Radius.circular(5)
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset("asset/svg_icons/user_black.svg",
                      color: _selectedIndex == 1 ? Colors.white: Colors.black),
                  SizedBox(width: 6),
                  Text("Account",
                    style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: _selectedIndex == 1 ? Colors.white: Colors.black
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}