

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class DateTimeController extends GetxController{


  DateTime? date;
  DateTime? time;

  LatLng? _currentLocation;
  LatLng? _sourceLocation;

  LatLng get currentUserLocation => _currentLocation!;
  LatLng get sourceLocation => _sourceLocation!;

  @override
  void onInit() {
    getUserCurrentLocation();
    super.onInit();
  }

  setDate(String date){
    date = date;
  }

  setTime(String time){
    time = time;
  }

  setSourceLocation(LatLng location){
    _sourceLocation = location;
    print("Source Location is $_sourceLocation");

  }

  void callApi () async {

  }

  Future<void> getUserCurrentLocation() async{

    Location location = new Location();
    bool? _serviceEnabled;
    PermissionStatus? _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        Get.snackbar("Note", "App needs to have your location turned on to work properly");
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        Get.snackbar("Note", "App needs to have your permission to access location properly");
        return;
      }
    }

    _locationData = await location.getLocation();
    _currentLocation = LatLng(_locationData.latitude!, _locationData.longitude!);
    print("User location is $_currentLocation");

  }

  updateCurrentLocation(LatLng location) {
    _currentLocation = location;
    update();
  }



}