import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Go_Router/routeDefination.dart';

class Button extends StatefulWidget {

  List<TextEditingController> inputvalueController;

  Button({super.key , required this.inputvalueController});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {

  bool isClicked = false;
  buttonState state = buttonState.init;
  String? noValue;

  @override
  Widget build(BuildContext context) {

    List<TextEditingController>? controllers = widget.inputvalueController;
    final screenWidht = MediaQuery.of(context).size.width;
    bool isStreched = state == buttonState.init;
    bool isDone = state == buttonState.done;
    final height = MediaQuery.of(context).size.height;

    return Center(
      child: Container(
        width: !isStreched? screenWidht*0.15 : screenWidht*0.75,
        height: height*0.075,
        child:  isStreched ?onClickButton(controllers) : strechedButton(isDone),
      ),
    );
  }

  ElevatedButton onClickButton(controller) {

    return ElevatedButton(
      onPressed: () async {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);

        String smsCode = controller.map((controller) => controller.text).join();

        setState(() => state = buttonState.loading);
        await Future.delayed(Duration(seconds: 2));

        context.go(pageRoute.onSuccess);
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
        "Verify OTP",
        style: GoogleFonts.inter(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Container strechedButton(bool isDone){
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: isDone ? Colors.green : Colors.blue,
      ),

      child: isDone ? Icon(Icons.done, color: Colors.white,size: 50) :
      CircularProgressIndicator(color: Colors.white,strokeWidth: 4.0,),
    );
  }
}

enum buttonState { init, loading, done }