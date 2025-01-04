import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'MyApplication/my_application.dart';

class AskForLeave extends StatefulWidget {
  const AskForLeave({super.key});

  @override
  State<AskForLeave> createState() => _AskForLeaveState();
}

class _AskForLeaveState extends State<AskForLeave> with SingleTickerProviderStateMixin {

//class _AskForLeaveState extends State<AskForLeave> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    print("Initializing TabController");
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    print("Disposing TabController");
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_ios),
        onPressed: (){},),
        centerTitle: true,
        title: Text(
          "Ask for leave",
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              child: Text(
                "New Application",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
            Tab(
              child: Text(
                "My Application",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(child:MyApplication(),),
          Center(child: Text("My Application Content")),
        ],
      ),
    );
  }
}

class _MyApplicationState {
}

// class _AskForLeaveState extends State<AskForLeave> with SingleTickerProviderStateMixin {
//
//   late TabController _tabController;
//
//   @override
//   void initState() {
//     super.initState();
//     // Initialize the TabController with the number of tabs
//     _tabController = TabController(length: 2, vsync: this );
//   }
//
//   @override
//   void dispose() {
//     // Dispose of the controller to free resources
//     _tabController.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: Icon(Icons.arrow_back_ios),
//         centerTitle: true,
//         title: Text("Ask for leave",
//           style: GoogleFonts.poppins(
//             fontSize: 22,
//             fontWeight: FontWeight.w400,
//             color: Colors.black,
//           ),),
//         bottom: TabBar(
//             controller: _tabController,
//             tabs:[
//               Tab(child: Text("New Application",
//                 style: GoogleFonts.poppins(
//                   fontSize: 22,
//                   fontWeight: FontWeight.w400,
//                   color: Colors.black,
//                 ),
//               )),
//
//               Tab(child: Text("My Application",
//                 style: GoogleFonts.poppins(
//                   fontSize: 22,
//                   fontWeight: FontWeight.w400,
//                   color: Colors.black,
//                 ),
//               )
//               )
//             ]
//         ),
//       ),
//     );
//   }
// }