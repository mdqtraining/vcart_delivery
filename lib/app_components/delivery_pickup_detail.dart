import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryPickupDetail extends StatefulWidget {
  const DeliveryPickupDetail({super.key});

  @override
  State<DeliveryPickupDetail> createState() => _DeliveryPickupDetailState();
}

class _DeliveryPickupDetailState extends State<DeliveryPickupDetail> {

  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  bool _isDropdownOpen = false;

  _toggleDropdown(BuildContext context) {
    if (_isDropdownOpen) {
      _closeDropdown();
    } else {
      _openDropdown(context);
    }
  }

  void _openDropdown(BuildContext context) {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context)?.insert(_overlayEntry!);
    setState(() {
      _isDropdownOpen = true;
    });
  }

  void _closeDropdown() {
    _overlayEntry?.remove();
    setState(() {
      _isDropdownOpen = false;
    });
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (context) => Stack(
        children: [
          // Background barrier to block touch interactions
          GestureDetector(
            onTap: _closeDropdown,
            child: Container(
              color: Colors.black.withOpacity(0.5), // Semi-transparent background
            ),
          ),
          // Positioned dropdown menu
          Positioned(
            width: 200, // Set your dropdown width
            child: CompositedTransformFollower(
              link: _layerLink,
              showWhenUnlinked: false,
              offset: Offset(0, 50), // Adjust position as needed
              child: Material(
                elevation: 8,
                color: Colors.white,
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  children: [
                    ListTile(
                      title: Text("Option 1"),
                      onTap: () {
                        print("Option 1 selected");
                        _closeDropdown();
                      },
                    ),
                    ListTile(
                      title: Text("Option 2"),
                      onTap: () {
                        print("Option 2 selected");
                        _closeDropdown();
                      },
                    ),
                    ListTile(
                      title: Text("Option 3"),
                      onTap: () {
                        print("Option 3 selected");
                        _closeDropdown();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  
  String dropDownValue = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(left: 24),
      child:CompositedTransformTarget(
        link: _layerLink,
        child: Container(
          //margin: EdgeInsets.all(16),
          height: 150,
          width: 328,
        
          decoration: BoxDecoration(
             color:  Color(0x33FF5963),
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
             // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Delivery Pickup By",
                          style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFFF5963),
                          ),),
                        Text("Tommorow",
                          style: GoogleFonts.istokWeb(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF57585A)
                          ),),
                        Text("5:30 PM, Thu, 25/08/2023",
                          style: GoogleFonts.istokWeb(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF57585A)
                          ),)
                      ],
                    ),
                    Spacer(),
                    //SizedBox(width: 2,)
                    Container(
                      height: 62,
                        width: 113,
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: Row(children: [
                              SvgPicture.asset("assets/svg_icons/clock.svg_icons"),
                              Text("TIME LEFT",
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFFF5963)
                              ),)
                            ],),
                          ),
        
                          Text("1:04 Hrs",
                            style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black
                            ),)
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Update Status",
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFF5963)
                      ),),
                    //DropdownMenu(dropdownMenuEntries: dropdownMenuEntries)
                    // Container(
                    //   //height: 60,
                    //   //width: 160,
                    //   child: DropdownButtonFormField(
                    //     items: status.map((String value) {
                    //       return DropdownMenuItem<String>(
                    //         value: value, // Assign the string value
                    //         child: Text(value), // Display the string value
                    //       );
                    //     }).toList(),
                    //     onChanged: (String? value) {
                    //       setState(() {
                    //         dropDownValue = value!; // Update selected value
                    //       });
                    //     },
                    // )
                    // )

                    _toggleDropdown(context),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<String> status = ["Out for Pickup",
                       "Out For Delivery",
                       "Failed Delivery Attempt",
                       "Delivered",
                       "Delivery Failed",
                       "Address Issue",
                       "Delivery Rescheduled"];

//enum status{Pending,Success,Out For Delivery,}


// Container(
// height: 32,
// width: 165,
// decoration: BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.all(Radius.circular(10)),
// border: Border.all(
// color: Color(0x44FF5963),
// width: 1,
// )
// ),
// child: Padding(
// padding: const EdgeInsets.only(left: 8,right: 8),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Text("Select option"),
// Spacer(),
// Icon(Icons.keyboard_arrow_down_sharp)
// ],
// ),
// ),
// )


