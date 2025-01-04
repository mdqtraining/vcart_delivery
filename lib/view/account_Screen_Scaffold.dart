import 'package:flutter/material.dart';

import '../app_components/topAppBar.dart';
import 'Account_Screen/account_Activity/account_Screen_assembled.dart';



class MyAccountMain extends StatefulWidget {
  const MyAccountMain({super.key});

  @override
  State<MyAccountMain> createState() => _MyAccountMainState();
}

class _MyAccountMainState extends State<MyAccountMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE8E8E8),
      appBar: CommonAppBar(lead: true,title: "Account",showLogo: true),
      body: AccountBodyContent()
    );
  }
}
