import 'package:flutter/material.dart';

class CountryCodeSelector extends StatefulWidget {
  const CountryCodeSelector({super.key});

  @override
  State<CountryCodeSelector> createState() => _CountryCodeSelectorState();
}

class _CountryCodeSelectorState extends State<CountryCodeSelector> {

  String selectedCountry = "+91";

  List<Map<String,dynamic>> Countries=[
    {'flag': '🇮🇳', 'code': '+91'},
  ];
  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: width *0.17,
      height: height*0.06,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey,width: 2),
        borderRadius: BorderRadius.circular(5)
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 4.0),
        child: DropdownButton<String>(

          underline: SizedBox.shrink(),
          value: selectedCountry,
          isExpanded: true,
          icon: Icon(Icons.arrow_drop_down,size: 0),
          items: Countries.map((country) {
            return DropdownMenuItem<String>(
              value: country['code'],
              child: Row(
                children: [
                  Text(country['flag']!),
                  SizedBox(width: 8),
                  Text(country['code']!),
                ],
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedCountry = value!;
            });
          },
        ),
      ),
    );
  }
}







