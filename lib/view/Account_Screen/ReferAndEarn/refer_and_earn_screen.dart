import 'package:flutter/material.dart';
import '../../../app_components/topAppBar.dart';
import 'advertisment_widget.dart';
import 'frequentlyAskedQuestion.dart';
import 'middlePart.dart';

class ReferAndEarnScreen extends StatelessWidget {
  const ReferAndEarnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Refer & Earn" , lead: true,),
      body: Container(
        child: ListView(
          children: [
           // Expanded(child: child)
            AdvertismentWidget(),
            MiddleContent(),
            SizedBox(height: 16),
            FrequentlyAskedQuesitons(),
          ],
        ),
      ),
    );
  }
}
