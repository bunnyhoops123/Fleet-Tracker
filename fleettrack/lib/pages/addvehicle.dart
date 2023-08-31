import 'package:fleettrack/components/mybutton.dart';
import 'package:fleettrack/data/vehicledata.dart';
import 'package:fleettrack/models/vehicelclass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AddVehicle extends StatefulWidget {
  const AddVehicle({super.key});

  @override
  State<AddVehicle> createState() => _AddVehicleState();
}

class _AddVehicleState extends State<AddVehicle> {
  TextStyle textStyle =
      GoogleFonts.dmSans(fontSize: 15, fontWeight: FontWeight.bold);
  TextEditingController _manufacturerController = TextEditingController();
  TextEditingController _modelController = TextEditingController();
  TextEditingController _odometerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //manufacturer
            Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  'Manufacturer: ',
                  style: textStyle,
                )),

            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(border: Border.all(width: 1)),
              child: TextField(
                controller: _manufacturerController,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 4),
                    border: InputBorder.none,
                    hintText: '  Enter Manufacturer'),
              ),
            ),

            //model
            Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  'Model: ',
                  style: textStyle,
                )),

            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(border: Border.all(width: 1)),
              child: TextField(
                controller: _modelController,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 4),
                    border: InputBorder.none,
                    hintText: '  Enter Model'),
              ),
            ),

            //year of purchase
            Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  'Year of Purchase: ',
                  style: textStyle,
                )),

            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(border: Border.all(width: 1)),
              //Month and Year picker
            ),

            //odometer
            Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  'Odometer: ',
                  style: textStyle,
                )),

            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(border: Border.all(width: 1)),
              child: TextField(
                controller: _odometerController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 4),
                    border: InputBorder.none,
                    hintText: '  Enter Odometer Reading'),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            MyButton(
                text: 'Save Vehicle',
                onTap: () {
                  vehicleList.value.add(Vehicle(
                      manufacturer: _manufacturerController.text,
                      model: _modelController.text,
                      purchaseYear: 2020,
                      odometer: _odometerController.text));
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}
