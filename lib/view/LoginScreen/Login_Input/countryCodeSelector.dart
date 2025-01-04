import 'package:flutter/material.dart';

class CountryCodeSelector extends StatefulWidget {
  const CountryCodeSelector({super.key});

  @override
  State<CountryCodeSelector> createState() => _CountryCodeSelectorState();
}

class _CountryCodeSelectorState extends State<CountryCodeSelector> {

  String selectedCountry = "+91";

  List<Map<String,dynamic>> Countries=[
    {'flag': '🇺🇸', 'code': '+1'},
    {'flag': '🇮🇳', 'code': '+91'},
    {'flag': '🇬🇧', 'code': '+44'},
    {'flag': '🇦🇺', 'code': '+61'},
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      height: 49,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5)
      ),
      child: DropdownButton<String>(
        value: selectedCountry,
        isExpanded: true,
        icon: Icon(Icons.arrow_drop_down,size: 7),
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
    );
  }
}







