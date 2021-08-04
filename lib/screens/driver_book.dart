import 'package:book_a_driver/consts/app_colors.dart';
import 'package:book_a_driver/consts/icons.dart';
import 'package:book_a_driver/controller/date_time_controller.dart';
import 'package:book_a_driver/widgets/date_picker.dart';
import 'package:book_a_driver/widgets/date_time_picker.dart';
import 'package:book_a_driver/widgets/map.dart';
import 'package:book_a_driver/widgets/location_chooser.dart';
import 'package:book_a_driver/widgets/button.dart';
import 'package:book_a_driver/widgets/time_picker.dart';
import 'package:book_a_driver/widgets/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DriverBook extends StatelessWidget {
  final DateTimeController dateTimeController = Get.put(DateTimeController());

  DriverBook({Key? key}) : super(key: key);
  final TextEditingController currentLocation = TextEditingController();
  final TextEditingController selectDestination = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Book a driver", style: TextStyle(color: Colors.black)),
          backgroundColor: appBarColor,
          centerTitle: true,
        ),
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            MapInput(),
            _buildContainer(context),
          ],
        ));
  }

  Widget _buildContainer(context) {
    final double size = Get.height;
    return Container(
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: new BorderRadius.only(
            topLeft: const Radius.circular(22.0),
            topRight: const Radius.circular(22.0),
          )),
      // color: backgroundColor,
      margin: EdgeInsets.only(top: size / 6.6),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: const EdgeInsets.only(bottom: 6.0, left: 16.0),
                  child: Text(
                    "Select Location",
                    style: Get.textTheme.bodyText2,
                  )),
              LocationChooser(
                name: "Current Location",
                icon: Icons.location_on,
                controller: currentLocation,
              ),
              LocationChooser(
                name: "Select Destination",
                icon: Icons.gps_fixed,
                controller: selectDestination,
              ),
              SizedBox(
                height: 8,
              ),
              InkWell(
                onTap: () {
                  dateTimeController.getUserCurrentLocation();
                  Get.to(MapInput());
                },
                child: Card(
                  color: Colors.grey[100],
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                          child: Icon(Icons.pin_drop_outlined)),
                      SizedBox(width: 12),
                      Text(
                        "Set on me",
                        style: Get.textTheme.bodyText2,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(
                      top: 20.0, bottom: 16.0, left: 16.0),
                  child: Text(
                    "Select Vehicle Type",
                    style: Get.textTheme.bodyText2,
                  )),
              Container(
                child: Row(
                  children: [
                    Vehicle(
                      name: "Standard",
                      icon: iconCar,
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    Vehicle(
                      name: "Car",
                      icon: iconCar,
                    ),
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(
                      top: 20.0, bottom: 18.0, left: 16.0),
                  child: Text(
                    "Select Date and Time",
                    style: Get.textTheme.bodyText2,
                  )),
              DateTimePicker(
                datetimeController: dateController,
                hint: 'yyyy/mm/dd',
                icon: iconDate,
                onTap: () async {
                  final date = await chooseDatePicker(context);
                  String formattedDate = DateFormat('yyyy-MM-dd').format(date!);
                  dateController.text = formattedDate;
                  dateTimeController.setDate(dateController.text);
                  print("date is $formattedDate");
                },
              ),
              SizedBox(
                height: 10,
              ),
              DateTimePicker(
                datetimeController: timeController,
                hint: 'hh/mm',
                icon: iconTime,
                onTap: () async {
                  final time = await chooseTimePicker(context);
                  String formattedTime = DateFormat('hh-mm').format(time!);
                  timeController.text = formattedTime;
                  dateTimeController.setTime(timeController.text);
                  print("time is $formattedTime");
                },
              ),
              SizedBox(
                height: 10,
              ),
              Button(text: "Request", onPressed: (){},),
            ],
          ),
        ),
      ),
    );
  }

/*  Widget _buildRequestButton() {
    return Container(
      width: double.infinity,
      height: Get.height/16,
      child: ElevatedButton(
        onPressed: (){
          //_onSubmit();
        },
        child: Text("Request"),
      ),
    );
  }*/

/*  void _onSubmit() {

    dateTimeController.callApi();

  }*/

}
