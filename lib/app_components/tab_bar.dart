import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabBarCustom extends StatefulWidget {

  final Function(int) onTabSelected;

  const TabBarCustom({super.key,required this.onTabSelected});

  @override
  State<TabBarCustom> createState() => _TabBarCustomState();
}

class _TabBarCustomState extends State<TabBarCustom> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index when a button is tapped
    });
    widget.onTabSelected(index);

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 182,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              _onItemTapped(0);

            },
            child: Container(
              height: 32,
              width: 91,
              decoration: BoxDecoration(
                color: _selectedIndex == 0 ? Color(0xFFFF5963) : Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: Center(
                child: Text(
                  "PickUp",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: _selectedIndex == 0 ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              _onItemTapped(1);
            },
            child: Container(
              height: 32,
              width: 91,
              decoration: BoxDecoration(
                color: _selectedIndex == 1 ? Color(0xFFFF5963) : Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: Center(
                child: Text(
                  "Delivery",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: _selectedIndex == 1 ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


