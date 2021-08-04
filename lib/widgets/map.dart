import 'dart:async';

import 'package:book_a_driver/controller/date_time_controller.dart';
import 'package:book_a_driver/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapInput extends StatefulWidget {
  MapInput({Key? key}) : super(key: key);

  @override
  _MapInputState createState() => _MapInputState();
}

class _MapInputState extends State<MapInput> {
  final DateTimeController dateTimeController = Get.put(DateTimeController());
  GoogleMapController? mapController;
  Marker? origin;
  Marker? destination;



  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GetBuilder<DateTimeController>(builder: (_){
          return buildGoogleMap();
        }),
        Positioned(
        top: Get.height/1.2,
          child: buildButton()),
      ],
    );
  }

  GoogleMap buildGoogleMap() {

    return GoogleMap(
    onMapCreated: (GoogleMapController controller){
      mapController = controller;
    },

      initialCameraPosition: CameraPosition(
        target: dateTimeController.currentUserLocation,
        zoom: 16,
      ),
      markers: {
      Marker(
        markerId: MarkerId(dateTimeController.currentUserLocation.toString()),
        infoWindow: InfoWindow(title: "User"),
        position: LatLng(dateTimeController.currentUserLocation.latitude,
            dateTimeController.currentUserLocation.longitude),
      )
      },

      onTap: (LatLng location) {
        dateTimeController.updateCurrentLocation(location);
        print("Current location is $location");
      },
    );
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Widget buildButton() {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Button(text: "Select", onPressed: (){
            _getSourceLocation();
          },)
        ],
      ),
    );
  }

  void _getSourceLocation() {
    dateTimeController.setSourceLocation(dateTimeController.currentUserLocation);
  }

/*  void _setMarkers(LatLng argument) {
    if(origin == null || (origin != null && destination != null)) {
      setState(() {
        origin = Marker(
          markerId: MarkerId(dateTimeController.currentUserLocation.toString()),
          infoWindow: InfoWindow(title: "Source"),
          position: LatLng(dateTimeController.currentUserLocation.latitude,
              dateTimeController.currentUserLocation.longitude),
        );

      });
      destination = null;
    }

    else{
      setState(() {
        destination = Marker(
          markerId: MarkerId(dateTimeController.currentUserLocation.toString()),
          infoWindow: InfoWindow(title: "destination"),
          position: LatLng(dateTimeController.currentUserLocation.latitude,
              dateTimeController.currentUserLocation.longitude),
        );

      });


    }
  }*/




}
