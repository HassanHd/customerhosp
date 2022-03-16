import 'package:customerapp/view/widgets/CustomButton.dart';
import 'package:customerapp/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:latlong2/latlong.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../../constant.dart';
import 'AmbulanceAddress.dart';

class AmbulancetTwo extends StatefulWidget {
  String idMedicalSpecialty;
  String MedicalSpecialty;

  @override
  _AmbulancetTwoState createState() => _AmbulancetTwoState();

  AmbulancetTwo({
    required this.idMedicalSpecialty,
    required this.MedicalSpecialty,
  });
}

class _AmbulancetTwoState extends State<AmbulancetTwo> {
  MapController _mapController = MapController();


  LatLng? currentPosition ;



  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   currentPosition = LatLng(30.2,32.0);
  // }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // print("${currentPosition!.latitude } , ${currentPosition!.longitude}");
    // currentPosition = LatLng(0 ,0);
    if(currentPosition==null){
      getLocation();
    }else{
      currentPosition = LatLng(currentPosition!.latitude ,currentPosition!.longitude );

    }
  }
  getLocation() async {
    final hasPermission = await _handlePermission();

    if (!hasPermission) {
      return;
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(" position $position");
    setState(() {
      currentPosition = LatLng(position.latitude,position.longitude) ;
    });
  }

  Future<bool> _handlePermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // do stuff
      return false;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // do stuff
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      // do stuff

      return false;
    }
    return true;
  }

  @override
  void initState() {
    getLocation();
    super.initState();

  }



  @override
  Widget build(BuildContext context) {
    if (currentPosition == null) {
      return Center(
          child: CircularProgressIndicator(
            backgroundColor: primarycolor,
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
          ));
    } else {
      return SafeArea(
        child: Scaffold(
          backgroundColor: textblue,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: CustomText(
              text: "Ambulance",
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
            padding: const EdgeInsets.only(
                left: 20.0, right: 20.0, top: 10.0, bottom: 0),
            child: Column(
              children: <Widget>[
                CustomText(
                  text: "Please hold the cursor and move it to change location.",
                  fontSize: 18,
                  color: gray,
                  alignment: Alignment.center,
                  textAlign: TextAlign.center,
                  // alignment: Alignment.center,
                ),
                SizedBox(height: 10),
                Container(
                  height: MediaQuery.of(context).size.height/2,
                  width: MediaQuery.of(context).size.width,
                  child: FlutterMap(
                      mapController: _mapController,
                      options: new MapOptions(
                        center: LatLng(currentPosition!.latitude,
                            currentPosition!.longitude ),
                        //minZoom: 10.0,
                        //maxZoom: 100,
                        zoom: 15,
                        interactiveFlags: InteractiveFlag.pinchZoom | InteractiveFlag.drag,
                        onTap: (val, ll){
                          print(ll.latitude.toString() + "  " + ll.longitude.toString());
                          setState(() {
                            currentPosition!.latitude = ll.latitude;
                            currentPosition!.longitude = ll.longitude;
                          });
                        },
                      ),
                      layers: [
                        new TileLayerOptions(
                          // maxZoom: 100,
                          //   minZoom: 10,
                            opacity: 0.9,
                            urlTemplate:
                            "https://api.mapbox.com/styles/v1/yaraislam/ckotpyuaa272317"
                                "sew91ffea9/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoieWFyYWlzbGFtIiwiYSI6ImNrcGRwZTNtazAwM3M"
                                "yb282Z3V4YmZnY3cifQ.fBCQZDIxJSeB37zB_pJdWg",
                            //"https://api.mapbox.com/styles/v1/hassan-daboos1997/ckvs4r62z0pkf14p8zdri19sf.html?title=view&access_token=pk.eyJ1IjoiaGFzc2FuLWRhYm9vczE5OTciLCJhIjoiY2t2cnptZ2RhMGN3MzJ2bTl4NDV6NjZqdiJ9.YYctoYCAMLdUNZ_B0uc5cQ&zoomwheel=true&fresh=true#12/48.8665/2.3176",
                            additionalOptions: {
                              'accessToken': "pk.eyJ1IjoieWFyYWlzbGFtIiwiYSI6ImNrcGRwZTNtazAwM3M"
                                  "yb282Z3V4YmZnY3cifQ.fBCQZDIxJSeB37zB_pJdWg",//"k.eyJ1IjoiaGFzc2FuLWRhYm9vczE5OTciLCJhIjoiY2t2cnptZ2RhMGN3MzJ2bTl4NDV6NjZqdiJ9.YYctoYCAMLdUNZ_B0uc5cQ",
                              'id': 'mapbox.mapbox-streets-v7',
                            }),
                        new MarkerLayerOptions(
                            markers: [
                              new Marker(
                                width: 45,
                                height: 45,
                                point: LatLng(currentPosition!.latitude, currentPosition!.longitude),
                                builder: (context) => Container(
                                  child: InkWell(
                                    child: Icon(Icons.location_on,
                                      color:  primarydarkcolor,
                                      size: 40,
                                    ),
                                    //Image.network("$assetsUrl${profileData.result[0].picture}", height: 40,),
                                    onTap:(){
                                      print("mpa");
                                    },
                                  ),
                                  // IconButton(
                                  //   icon: Icon(Icons.location_on),
                                  //   color: Colors.red,
                                  //   iconSize: 45,
                                  //   tooltip: "sssss",
                                  //   onPressed: () async{
                                  //     print("tapped");
                                  //   },
                                  // ),
                                ),
                              ),
                            ]
                        ),
                      ]),
                ),
                SizedBox(height: 10),
                CustomText(
                  text: "location is $currentPosition",
                  fontSize: 13,
                  color: gray,
                  alignment: Alignment.center,
                  textAlign: TextAlign.center,
                  // alignment: Alignment.center,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                CustomButton(
                  text: 'Next',
                  onPressed: () {
                    // Navigator.pop(context, currentPosition);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AmbulanceAddress(longitude: '${currentPosition!.longitude}',idMedicalSpecialty:'${widget.idMedicalSpecialty}',MedicalSpecialty: '${widget.MedicalSpecialty}',latitude: '${currentPosition!.latitude}',)),
                    );
                  },
                ),

              ],
            ),
          ),

        ),
      );

    }

  }




}
