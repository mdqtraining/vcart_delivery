import 'package:eatfit_delivery_partner/view/Account_Screen/AskForLeave/MyApplication/text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApplication extends StatefulWidget {
  const MyApplication({super.key});

  @override
  State<MyApplication> createState() => _MyApplicationState();
}

class _MyApplicationState extends State<MyApplication> {
  DateTime selectedDate_From = DateTime.now();
  DateTime selectedDate_To = DateTime.now();
  int? selectedNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text("Request your leave details down below",
              style: GoogleFonts.radioCanada(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),),
            SizedBox(height: 21),
            Row(
              children: [

                Text("How many days?",
                  style: GoogleFonts.istokWeb(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF57585A),
                  ),),

               Spacer(),
                Container(
                  height: 38,
                  width: 160,
                  //padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(83),
                    border: Border.all(color: Color(0xFFFF5963), width: 1),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0),
                        child: DropdownButton<int>(
                          value: selectedNumber,
                          hint: Text("Select "), // Hint when no value is selected
                          underline: SizedBox(), // Removes the default underline
                          menuWidth: 50,
                          icon: Icon(Icons.arrow_drop_down, color: Colors.blueAccent),
                          items: List.generate(7, (index) {
                            int number = index + 1; // Generate numbers 1 through 7
                            return DropdownMenuItem<int>(
                              value: number,
                              child: Text(number.toString()), // Display the number
                            );
                          }),
                          onChanged: (value) {
                            setState(() {
                              selectedNumber = value; // Update the selected value
                            });
                          },
                        ),
                      ),
                      //Icon(Icons.arrow_drop_down, color: Colors.blueAccent),
                    ],
                  ),
                )
              ],
            ),

            SizedBox(height: 16,),

               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("From",
                    style: GoogleFonts.istokWeb(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF57585A),
                    ),
                  ),

                    SizedBox(),

                    GestureDetector(
                      onTap: () async{
                        final DateTime? datepicker = await showDatePicker(context: context,
                firstDate: DateTime(1000),
                lastDate: DateTime(3000));
                        if(datepicker != null){
              setState(() {
                selectedDate_From = datepicker;
              });
                        }
                      },
                      child: Container(
                        height: 38,
                        width: 160,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Color(0xFFFF5963),
                          ),
              borderRadius: BorderRadius.all(Radius.circular(50)),
              color: Colors.white,
                        ),
                        child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [Text("${selectedDate_From.day}/${selectedDate_From.month}/${selectedDate_From.year}",
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black
                  )),
                SvgPicture.asset("assets/svg_icons/refer/calender.svg_icons"),],
                        ),
                      ),
                    ),
                ],
              ),

            //To date

            SizedBox(height: 16,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("To",
                  style: GoogleFonts.istokWeb(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF57585A),
                  ),
                ),

                SizedBox(),

                GestureDetector(
                  onTap: () async{
                    final DateTime? datepicker = await showDatePicker(context: context,
                        firstDate: DateTime(1000),
                        lastDate: DateTime(3000));
                    if(datepicker != null){
                      setState(() {
                        selectedDate_From = datepicker;
                      });
                    }
                  },
                  child: Container(
                    height: 38,
                    width: 160,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Color(0xFFFF5963),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [Text("${selectedDate_To.day}/${selectedDate_To.month}/${selectedDate_To.year}",
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black
                          )),
                        SvgPicture.asset("assets/svg_icons/refer/calender.svg_icons"),],
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 16,),
            Row(
              children: [

                Text("How many days?",
                  style: GoogleFonts.istokWeb(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF57585A),
                  ),),

                Spacer(),
                Container(
                  height: 38,
                  width: 160,
                  //padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(83),
                    border: Border.all(color: Color(0xFFFF5963), width: 1),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0),
                        child: DropdownButton<int>(
                          value: selectedNumber,
                          hint: Text("Select "), // Hint when no value is selected
                          underline: SizedBox(), // Removes the default underline
                          menuWidth: 50,
                          icon: Icon(Icons.arrow_drop_down, color: Colors.blueAccent),
                          items: List.generate(7, (index) {
                            int number = index + 1; // Generate numbers 1 through 7
                            return DropdownMenuItem<int>(
                              value: number,
                              child: Text(number.toString()), // Display the number
                            );
                          }),
                          onChanged: (value) {
                            setState(() {
                              selectedNumber = value; // Update the selected value
                            });
                          },
                        ),
                      ),
                      //Icon(Icons.arrow_drop_down, color: Colors.blueAccent),
                    ],
                  ),
                )
              ],
            ),

            SizedBox(height: 16),

            Text("Comments",
              style: GoogleFonts.istokWeb(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFF57585A),
              ),),
            SizedBox(height: 4),
            LeaveReasonTextBox(),

            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    width: 360,
                    height: 58,
                    child: ElevatedButton(
                      onPressed: () {
                        // Add your button action here
                        context.push("/success");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF5963), // Button color
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30), // Rounded edges
                        ),
                      ),

                      child: Text(
                        "Submit",
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
    );
  }
}
