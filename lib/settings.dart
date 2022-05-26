// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:rental_of_goods/styles/main_colors.dart';
// import 'package:rental_of_goods/styles/text_style/style_settings_page.dart';

// class SettingsPage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _StateSettingsPage();
//   }
// }

// class _StateSettingsPage extends State<SettingsPage> {
//   bool Push1 = false;
//   bool Push2 = false;
//   bool SMS1 = false;
//   bool SMS2 = false;
//   @override
//   Widget build(BuildContext context) {
//     double screenHeight = MediaQuery.of(context).size.height;
//     double screenWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: color_text_white,
//         leading: GestureDetector(
//           child: Icon(
//             Icons.arrow_back_ios,
//             color: color_text_black,
//           ),
//           onTap: () {
//             Navigator.of(context).pop();
//           },
//         ),
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "Мой профиль",
//               style: style_title1,
//             ),
//             Text(
//               "/ Настройки",
//               style: style_title2,
//             ),
//             Opacity(
//               opacity: 0,
//               child: GestureDetector(
//                 child: Icon(
//                   Icons.arrow_back_ios,
//                   color: color_text_black,
//                 ),
//                 onTap: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             )
//           ],
//         ),
//       ),
//       body: ListView(
//         children: [
//           Container(
//             height: screenHeight,
//             color: color_text_white,
//             padding: EdgeInsets.all(20),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Уведомления",
//                   style: style_title2,
//                 ),
//                 Container(
//                   height: screenHeight,
//                   color: color_text_white,
//                   padding: EdgeInsets.all(20),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "О новых товарах",
//                         style: style_title1,
//                       ),
//                       SizedBox(
//                         height: screenHeight * 0.02,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             "ПУШ",
//                             style: style_title1,
//                           ),
//                           SizedBox(
//                             width: screenWidth * 0.1,
//                           ),
//                           CupertinoSwitch(
//                             value: Push1,
//                             activeColor: color_button_next,
//                             onChanged: (value) {
//                               if (value) {
//                                 Permission.notification.request().isGranted;
//                                 setState(() {
//                                   Push1 = value;
//                                 });
//                                 print(Push1);
//                               }
//                             },
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: screenHeight * 0.01,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             "СМС",
//                             style: style_title1,
//                           ),
//                           SizedBox(
//                             width: screenWidth * 0.1,
//                           ),
//                           CupertinoSwitch(
//                             value: SMS1,
//                             activeColor: color_button_next,
//                             onChanged: (value) {
//                               if (value) {
//                                 Permission.sms.request().isGranted;
//                                 setState(() {
//                                   SMS1 = value;
//                                 });
//                                 print(SMS1);
//                               }
//                             },
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: screenHeight * 0.02,
//                       ),
//                       Container(
//                         width: screenWidth,
//                         decoration: BoxDecoration(
//                             border: Border(
//                                 bottom: BorderSide(
//                                     width: 0.2, color: color_text_grey))),
//                       ),
//                       SizedBox(
//                         height: screenHeight * 0.02,
//                       ),
//                       Text(
//                         "О сообщениях",
//                         style: style_title1,
//                       ),
//                       SizedBox(
//                         height: screenHeight * 0.02,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             "ПУШ",
//                             style: style_title1,
//                           ),
//                           SizedBox(
//                             width: screenWidth * 0.1,
//                           ),
//                           CupertinoSwitch(
//                             value: Push2,
//                             activeColor: color_button_next,
//                             onChanged: (value) {
//                               if (value) {
//                                 Permission.notification.request().isGranted;
//                                 setState(() {
//                                   Push2 = value;
//                                 });
//                                 print(Push2);
//                               }
//                             },
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: screenHeight * 0.01,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             "СМС",
//                             style: style_title1,
//                           ),
//                           SizedBox(
//                             width: screenWidth * 0.1,
//                           ),
//                           CupertinoSwitch(
//                             value: SMS2,
//                             activeColor: color_button_next,
//                             onChanged: (value) {
//                               if (value) {
//                                 Permission.sms.request().isGranted;
//                                 setState(() {
//                                   SMS2 = value;
//                                 });
//                                 print(SMS2);
//                               }
//                             },
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
