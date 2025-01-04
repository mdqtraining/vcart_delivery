import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpVerificationTextField extends StatefulWidget {

  final List<TextEditingController> controllers;

  const OtpVerificationTextField({Key? key, required this.controllers}) : super(key: key);

  @override
  _OtpVerificationTextFieldState createState() =>
      _OtpVerificationTextFieldState();
}

class _OtpVerificationTextFieldState extends State<OtpVerificationTextField> {

  @override

  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

  @override
  void dispose() {

    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _onOtpChange(String value, int index) {
    if (value.length == 1) {
      // Move to next field if not the last one
      if (index < _focusNodes.length - 1) {
        FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
      }
    } else if (value.isEmpty) {
      // Move to the previous field if backspace is pressed
      if (index > 0) {
        FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
      }
    }
  }


  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double widhth  = MediaQuery.of(context).size.width;

    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(6, (index) {
          return Container(
            alignment: Alignment.center,
            height: height*0.065,
            width: widhth*0.125,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFF34A853)),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: TextFormField(
              focusNode: _focusNodes[index],
              controller: widget.controllers[index],
              onChanged: (value) => _onOtpChange(value, index),
              decoration: InputDecoration(border: InputBorder.none),
              style: Theme.of(context).textTheme.headlineMedium,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          );
        }),
      ),
    );
  }
}