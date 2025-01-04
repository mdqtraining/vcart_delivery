import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DatePickingContainer extends StatefulWidget {
  const DatePickingContainer({super.key});

  @override
  State<DatePickingContainer> createState() => _DatePickingContainerState();
}

class _DatePickingContainerState extends State<DatePickingContainer> {

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async{
        final DateTime? datepicker = await showDatePicker(context: context,
            firstDate: DateTime(1000),
            lastDate: DateTime(3000));
        if(datepicker != null){
          setState(() {
            selectedDate = datepicker;
          });
        }
      },
      child: Container(
        // margin: EdgeInsets.only(left: 6),
        height: 32,
        width: 126,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
              style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black
              )),
            Icon(Icons.keyboard_arrow_down_rounded ,
              color: Color(0xFFFF5963),
              size: 24,)],
        ),
      ),
    );
  }
}
