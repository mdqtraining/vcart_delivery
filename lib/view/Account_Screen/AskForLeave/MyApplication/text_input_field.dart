import 'package:flutter/material.dart';

class LeaveReasonTextBox extends StatefulWidget {
  @override
  _LeaveReasonTextBoxState createState() => _LeaveReasonTextBoxState();
}

class _LeaveReasonTextBoxState extends State<LeaveReasonTextBox> {
  final int maxWords = 200;
  String text = "";

  int getWordCount(String input) {
    return input.trim().split(RegExp(r'\s+')).where((word) => word.isNotEmpty).length;
  }

  @override
  Widget build(BuildContext context) {
    int wordCount = getWordCount(text);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TextField
          Container(
            height: 150, // Fixed height for the text box
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              maxLines: null, // Allow multiline input
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Enter your reason here...",
              ),
              onChanged: (value) {
                setState(() {
                  // Update the text only if it doesn't exceed the word limit
                  if (getWordCount(value) <= maxWords) {
                    text = value;
                  }
                });
              },
            ),
          ),
          SizedBox(height: 8),
          // Word Counter
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "$wordCount/$maxWords words",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//void main() => runApp(MaterialApp(home: Scaffold(body: LeaveReasonTextBox())));
