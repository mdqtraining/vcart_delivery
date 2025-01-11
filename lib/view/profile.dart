// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
//
// class profile extends StatefulWidget {
//   const profile({super.key});
//
//   @override
//   State<profile> createState() => _profileState();
// }
//
// class _profileState extends State<profile> {
//   @override
//   Widget build(BuildContext context) {
//
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text("Profile",style: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.bold)),
//         backgroundColor: Colors.white,
//       ),
//
//       body: Consumer<>(
//         child: Padding(
//           padding: const EdgeInsets.only(top: 24.0),
//           child: Container(
//             //color: Colors.blue,
//             child: Column(
//               children: [
//                 Container(
//                   width: width,
//                   child: Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(50),
//                             color: Colors.blue
//                           ),
//                           height: 100,
//                           width: 100,
//                         ),
//
//                         SizedBox(height: 16),
//
//                         Text("Name goes here"),
//                       ],
//                     ),
//                   ),
//                 ),
//
//                 SizedBox(height: 24),
//
//                 Flexible(
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     child: ListView.builder(
//                         itemCount: 10,
//                         itemBuilder: (context,index){
//                           return GestureDetector(
//                             onTap: (){},
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 border: Border(bottom: BorderSide(width: 1,color: Colors.grey))
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.symmetric(vertical: 8.0),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Icon(Icons.add),
//                                     Text("Title Goes here"),
//                                     Icon(Icons.back_hand),
//                                   ],
//                                 ),
//                               )
//                             ),
//                           );
//                         }),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
