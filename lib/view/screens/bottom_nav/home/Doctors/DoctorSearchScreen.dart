import 'dart:convert';

import 'package:customerapp/controller/ControlerSpecialty.dart';
import 'package:customerapp/controller/FieldsController.dart';
import 'package:customerapp/model/Specialty.dart';
import 'package:customerapp/view/widgets/CustomButton.dart';
import 'package:customerapp/view/widgets/custom_text.dart';
import 'package:customerapp/view/widgets/specialtycard.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../../../constant.dart';
import 'DoctorListScreen.dart';
import 'package:http/http.dart' as http;

class DoctorSearchScreen extends StatefulWidget {
  const DoctorSearchScreen({Key? key}) : super(key: key);

  @override
  _DoctorSearchScreenState createState() => _DoctorSearchScreenState();
}

List Specialtychick = [];

class _DoctorSearchScreenState extends State<DoctorSearchScreen> {
  double _min = 0;
  double _max = 2000;
  SfRangeValues _values = const SfRangeValues(0, 2000);
  String? Time;
  double? stars;
  Color Containercolor = Colors.transparent;
  String? Governorate = "Select Governorate";
  var radioItemPrices;

// value set to false

  var mySelection;
  List dataSpecialty = [];

  fetchSpecialty() async {
    dataSpecialty = [];
    dataSpecialty.clear();
    dataSpecialty = ["Select Specialty"];
    mySelection = "Select Specialty";
    var url = Uri.parse(
        'https://el-mostashfa.com/Api/careAPI/api/specialization');
    print("url $url");
    var response = await http.get(url);
    var responsbody = jsonDecode(response.body)["response"]["data"];
    for (var i in responsbody) {
      dataSpecialty.add("${i["name"]},${i["id"]}");
    }
    print("datafrom $dataSpecialty");
    return dataSpecialty;
  }
  var Country;
  List dataCountry = [];
  fetchCountry() async {
    dataCountry = [];
    dataCountry.clear();
    dataCountry = ["Select Country"];
    Country = "Select Country";
    var url = Uri.parse(
        'https://el-mostashfa.com/Api/careAPI/api/get_Country');
    print("url $url");
    var response = await http.get(url);
    var responsbody = jsonDecode(response.body)["response"]["data"];
    for (var i in responsbody) {
      dataCountry.add("${i["country"]}");
    }
    print("dataCountry $dataCountry");
    return dataCountry;
  }
  var city;
  List datacity = [];
  fetchcity(String country) async {
    datacity = [];
    datacity.clear();
    datacity = ["Select City"];
    city = "Select City";
    var url = Uri.parse(
        'https://el-mostashfa.com/Api/careAPI/api/get_cityAndState?name=$country');
    print("url $url");
    var response = await http.get(url);
    var responsbody = jsonDecode(response.body)["response"]["cities"];
    for (var i in responsbody) {
      datacity.add("${i["name"]}");
    }
    print("datacity $datacity");
    return datacity;
  }

  @override
  void initState() {
    fetchSpecialty();
    fetchCountry();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: textblue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: CustomText(
          text: "Consultations",
          color: black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: primarydarkcolor,
            size: 35,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: ListView(
          children: [
            ListTile(
              dense: true,
              title: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Text(
                  "Medical Specialty",
                  style: TextStyle(
                      color: black, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              subtitle: Container(
                height: 60,
                padding:
                    const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10),
                margin:
                    const EdgeInsets.symmetric(vertical: 2.0, horizontal: 2),
                child: DropdownButton(
                  elevation: 0,
                  underline: SizedBox(),

                  hint: Text("Select Specialty"),
                  items: dataSpecialty == null
                      ? null
                      : dataSpecialty.map((item) {
                          return DropdownMenuItem(
                            child: Text("${item.split(',')[0]}"),
                            value: "$item",
                          );
                        }).toList(),
                  isExpanded: true,
                  iconSize: 20.0,
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: primarydarkcolor,
                  ),

                  onChanged: (newVal) {
                    setState(() {
                      mySelection = newVal.toString();
                      print("mySelection ${mySelection}");
                    });
                  },
                  value: mySelection,
                ),

              ),


            ),
            ListTile(
              dense: true,
              title: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Text(
                  "Country",
                  style: TextStyle(
                      color: black, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              subtitle: Container(
                height: 60,
                padding:
                const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10),
                margin:
                const EdgeInsets.symmetric(vertical: 2.0, horizontal: 2),
                child: DropdownButton(
                  elevation: 0,
                  underline: SizedBox(),

                  hint: Text("Select Country"),
                  items: dataCountry == null
                      ? null
                      : dataCountry.map((item) {
                    return DropdownMenuItem(
                      child: Text("${item}"),
                      value: "$item",
                    );
                  }).toList(),
                  isExpanded: true,
                  iconSize: 20.0,
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: primarydarkcolor,
                  ),

                  onChanged: (newVal) {
                    setState(() {
                      Country = newVal.toString();
                      print("Country ${Country}");
                      fetchcity(Country);
                    });
                  },
                  value: Country,
                ),

              ),


            ),

            ListTile(
              dense: true,
              title: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Text(
                  "City",
                  style: TextStyle(
                      color: black, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              subtitle: Container(
                height: 60,
                padding:
                const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10),
                margin:
                const EdgeInsets.symmetric(vertical: 2.0, horizontal: 2),
                child: DropdownButton(

                  elevation: 0,
                  underline: SizedBox(),

                  hint: Text("Select City"),
                  items: datacity == null
                      ? null
                      : datacity.map((item) {
                    return DropdownMenuItem(
                      child: Text("${item}"),
                      value: "$item",
                    );
                  }).toList(),
                  isExpanded: true,
                  iconSize: 20.0,
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: primarydarkcolor,
                  ),

                  onChanged: (newVal) {
                    setState(() {
                      city = newVal.toString();
                      print("city ${city}");

                    });
                  },
                  value: city,
                ),

              ),


            ),
            ListTile(
              title: Padding(
                padding: const EdgeInsets.all(5.0),
                child: CustomText(
                    text: "Prices",
                    color: black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Container(child:
                  Consumer<FieldsController>(builder: (context, value, child) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: value.priceslist.length,
                  itemBuilder: (BuildContext context, int index) {
                    return RadioListTile(
                        groupValue: radioItemPrices,
                        value: value.priceslist[index].toString(),
                        activeColor: primarydarkcolor,
                        dense: true,
                        title: Text(
                          value.priceslist[index],
                        ),
                        onChanged: (Object? value) {
                          setState(() {
                            radioItemPrices = value;
                          });
                        });
                  },
                );
              })),
            ),
            // ListTile(
            //   title: Padding(
            //     padding: const EdgeInsets.symmetric(vertical: 5.0),
            //     child: Text(
            //       "Rating",
            //       style: TextStyle(
            //           color: black, fontSize: 18, fontWeight: FontWeight.bold),
            //     ),
            //   ),
            //   subtitle: RatingBar.builder(
            //     initialRating: 0,
            //     minRating: 1,
            //     direction: Axis.horizontal,
            //     allowHalfRating: true,
            //     itemCount: 5,
            //     itemSize: 25,
            //     itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            //     itemBuilder: (context, _) => Icon(
            //       Icons.star,
            //       color: Colors.amber,
            //     ),
            //     onRatingUpdate: (rating) {
            //       print(rating);
            //       setState(() {
            //         stars = rating;
            //       });
            //     },
            //   ),
            // ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: CustomButton(
                text: 'Apply',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return DoctorListScreen(city:city ,catid:mySelection ,country:Country ,prices:radioItemPrices ,);
                    },
                  ));
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
            ),
          ],
        ),
      ),
    );
  }
}
