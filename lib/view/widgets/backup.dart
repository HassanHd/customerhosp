// import 'package:customerapp/controller/ControlerSpecialty.dart';
// import 'package:customerapp/view/widgets/CustomButton.dart';
// import 'package:customerapp/view/widgets/custom_text.dart';
// import 'package:customerapp/view/widgets/specialtycard.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:syncfusion_flutter_sliders/sliders.dart';
//
// import '../../../../../constant.dart';
//
// class HealthCareScreen extends StatefulWidget {
//   const HealthCareScreen({Key? key}) : super(key: key);
//
//   @override
//   _HealthCareScreenState createState() => _HealthCareScreenState();
// }
//
// List Specialtychick = [];
//
// class _HealthCareScreenState extends State<HealthCareScreen> {
//   double _min = 0;
//   double _max = 2000;
//   SfRangeValues _values = const SfRangeValues(0, 2000);
//   String? Time;
//   double? stars;
//   Color Containercolor = Colors.transparent;
//   String? city = "Select City";
//   String? Governorate = "Select Governorate";
//
// // value set to false
//   var radioItem;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: textblue,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         centerTitle: true,
//         title: CustomText(
//           text: "Health Care",
//           color: black,
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//         ),
//
//         leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back_ios,
//             color: primarydarkcolor,
//             size: 35,
//           ),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
//         child: ListView(
//           children: [
//             Padding(
//               padding:
//               const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
//               child: CustomText(
//                 text: "Medical Specialty",
//                 color: black,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Container(
//               child: FutureBuilder(
//                 future: ControlerSpecialty.getSpecialty(),
//                 builder:
//                     (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//                   return (snapshot.hasData)
//                       ? GridView.builder(
//                     physics: NeverScrollableScrollPhysics(),
//                     shrinkWrap: true,
//                     itemCount: snapshot.data.length,
//                     gridDelegate:
//                     SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 3, childAspectRatio: 2.0),
//                     itemBuilder: (BuildContext context, int index) {
//                       return SpecialtyCard(
//                         // image: '${snapshot.data[index].icon}',
//                         Containercolor: Containercolor,
//                         id: snapshot.data[index].id,
//                         name: '${snapshot.data[index].name}',
//                       );
//                     },
//                   )
//                       : Center(child: CircularProgressIndicator());
//                 },
//               ),
//             ),
//             ListTile(
//                 dense: false,
//                 title: Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 5.0),
//                   child: CustomText(
//                       text: "Select Governorate",
//                       color: black,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold
//
//                   ),
//                 ),
//                 subtitle: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                   child: DropdownButtonHideUnderline(
//                     child: DropdownButton(
//                       hint: CustomText(
//                           text: "$Governorate",
//                           color: gray
//                       ),
//                       items: [
//                         "Select Governorate",
//                         "Alexandria",
//                         "	Aswan",
//                         "Cairo"
//                       ].map(
//                             (val) {
//                           return DropdownMenuItem<String>(
//                             value: val,
//                             child: Text(val),
//                           );
//                         },
//                       ).toList(),
//                       isExpanded: true,
//                       iconSize: 20.0,
//                       icon: Icon(
//                         Icons.arrow_forward_ios,
//                         color: primarydarkcolor,
//                       ),
//                       style: TextStyle(
//                         color: primarydarkcolor,
//                         fontSize: 16,
//                       ),
//                       onChanged: (value) {
//                         setState(() {
//                           Governorate = value.toString();
//                         });
//                       },
//                     ),
//                   ),
//                 )
//               // trailing: Icon(Icons.arrow_forward_ios),
//             ),
//             ListTile(
//                 dense: false,
//                 title: Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 5.0),
//                     child: CustomText(
//                         text:
//                         "Select City",
//                         color: black,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold)
//                 ),
//                 subtitle: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                   child: DropdownButtonHideUnderline(
//                     child: DropdownButton(
//                       hint: Text(
//                         "$city",
//                         style: TextStyle(color: gray),
//                       ),
//                       items: ["Select City", "Cairo", "Alex"].map(
//                             (val) {
//                           return DropdownMenuItem<String>(
//                             value: val,
//                             child: Text(val),
//                           );
//                         },
//                       ).toList(),
//                       isExpanded: true,
//                       iconSize: 20.0,
//                       icon: Icon(
//                         Icons.arrow_forward_ios,
//                         color: primarydarkcolor,
//                       ),
//                       style: TextStyle(
//                         color: primarydarkcolor,
//                         fontSize: 16,
//                       ),
//                       onChanged: (value) {
//                         setState(() {
//                           city = value.toString();
//                         });
//                       },
//                     ),
//                   ),
//                 )
//               // trailing: Icon(Icons.arrow_forward_ios),
//             ),
//             //Padding
//             ListTile(
//               title: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 5.0),
//                 child: CustomText(
//                     text:
//                     "Sanitary Isolation",
//                     color: black,
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold
//                 ),
//               ),
//               dense: false,
//               subtitle: Row(
//                 children: [
//                   Expanded(
//                     flex: 50,
//                     child: RadioListTile(
//                       groupValue: radioItem,
//                       value: "1",
//                       activeColor: primarydarkcolor,
//                       title: Text("Yse"),
//                       onChanged: (val) {
//                         setState(() {
//                           radioItem = val;
//                           print("radioItem----$radioItem");
//                         });
//                       },
//                     ),
//                   ),
//                   Expanded(
//                     flex: 50,
//                     child: RadioListTile(
//                       groupValue: radioItem,
//                       value: "0",
//                       activeColor: primarydarkcolor,
//                       title: Text("NO"),
//                       onChanged: (val) {
//                         setState(() {
//                           radioItem = val;
//                           print("radioItem----$radioItem");
//                         });
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             ListTile(
//               title: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 5.0),
//                 child: CustomText(
//                     text:
//                     "insurance companies",
//                     color: black,
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold
//                 ),
//               ),
//               dense: false,
//               subtitle: Column(
//                 children: [
//                   RadioListTile(
//                     groupValue: radioItem,
//                     value: "1",
//                     activeColor: primarydarkcolor,
//                     title: Text("شركة مصر للتأمين"),
//                     onChanged: (val) {
//                       setState(() {
//                         radioItem = val;
//                         print("radioItem----$radioItem");
//                       });
//                     },
//                   ),
//                   RadioListTile(
//                     groupValue: radioItem,
//                     value: "0",
//                     activeColor: primarydarkcolor,
//                     title: Text("شركة أليانز للتأمين"),
//                     onChanged: (val) {
//                       setState(() {
//                         radioItem = val;
//                         print("radioItem----$radioItem");
//                       });
//                     },
//                   ),
//                   RadioListTile(
//                     groupValue: radioItem,
//                     value: "2",
//                     activeColor: primarydarkcolor,
//                     title: Text("شركة الدلتا للتأمين Delta insurance"),
//                     onChanged: (val) {
//                       setState(() {
//                         radioItem = val;
//                         print("radioItem----$radioItem");
//                       });
//                     },
//                   ),
//                 ],
//               ),
//             ),
//             ListTile(
//               title: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 5.0),
//                 child: CustomText(
//                     text:
//                     "Price Range",
//                     color: black, fontSize: 18, fontWeight: FontWeight.bold
//                 ),
//               ),
//               subtitle: SfRangeSlider(
//                 min: _min,
//                 max: _max,
//                 values: _values,
//                 interval: 500,
//                 showTicks: true,
//                 showLabels: true,
//                 minorTicksPerInterval: 1,
//                 enableTooltip: true,
//                 activeColor: primarydarkcolor,
//                 inactiveColor: gray,
//                 numberFormat: NumberFormat("\ EGP"),
//                 onChanged: (SfRangeValues value) {
//                   setState(() {
//                     _values = value;
//                     print("valuex---->$value");
//                   });
//                 },
//               ),
//             ),
//             ListTile(
//               title: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 5.0),
//                 child: Text(
//                   "Rating",
//                   style: TextStyle(
//                       color: black, fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               subtitle: RatingBar.builder(
//                 initialRating: 0,
//                 minRating: 1,
//                 direction: Axis.horizontal,
//                 allowHalfRating: true,
//                 itemCount: 5,
//                 itemSize: 25,
//                 itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
//                 itemBuilder: (context, _) => Icon(
//                   Icons.star,
//                   color: Colors.amber,
//                 ),
//                 onRatingUpdate: (rating) {
//                   print(rating);
//                   setState(() {
//                     stars = rating;
//                   });
//                 },
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height / 50,
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 20,
//               ),
//               child: CustomButton(
//                 text: 'Apply',
//                 onPressed: () {
//                   // Navigator.push(
//                   //     context,
//                   //     MaterialPageRoute(
//                   //       builder: (context) {
//                   //         return ListSearch();
//                   //
//                   //       },
//                   //     ));
//                 },
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height / 50,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
