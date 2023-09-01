import 'package:fleettrack/components/mybutton.dart';
import 'package:fleettrack/data/vehicledata.dart';
import 'package:fleettrack/models/vehicelclass.dart';
import 'package:fleettrack/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AddVehicle extends StatefulWidget {
  const AddVehicle({super.key});

  @override
  State<AddVehicle> createState() => _AddVehicleState();
}

class _AddVehicleState extends State<AddVehicle> {
  DateTime? _dateSelected;
  TextStyle textStyle =
      GoogleFonts.dmSans(fontSize: 15, fontWeight: FontWeight.bold);
  TextEditingController _manufacturerController = TextEditingController();
  TextEditingController _modelController = TextEditingController();
  TextEditingController _odometerController = TextEditingController();

  //Date Picker
  Future<void> _onPressed({
    required BuildContext context,
    String? locale,
  }) async {
    final localeObj = locale != null ? Locale(locale) : null;
    final selected = await showMonthYearPicker(
      context: context,
      initialDate: _dateSelected ?? DateTime.now(),
      firstDate: DateTime(1980),
      lastDate: DateTime(2040),
      locale: localeObj,
    );
    // final selected = await showDatePicker(
    //   context: context,
    //   initialDate: _selected ?? DateTime.now(),
    //   firstDate: DateTime(2019),
    //   lastDate: DateTime(2022),
    //   locale: localeObj,
    // );
    if (selected != null) {
      setState(() {
        _dateSelected = selected;
      });
    }
  }

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
            Row(
              children: [
                Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      'Year of Purchase: ',
                      style: textStyle,
                    )),
                if (_dateSelected == null)
                  const Text('No month/year selected.')
                else
                  Text(DateFormat().add_yM().format(_dateSelected!)),
              ],
            ),
            TextButton(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.calendar_month,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Calender',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.arrow_downward,
                    color: Colors.black,
                    size: 15,
                  )
                ],
              ),
              onPressed: () => _onPressed(context: context),
            ),

            // Container(
            //   margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            //   decoration: BoxDecoration(border: Border.all(width: 1)),
            //   //Month and Year picker
            // ),

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
                  if (_dateSelected.isBlank! ||
                      _manufacturerController.text == '' ||
                      _modelController.text == '' ||
                      _odometerController.text == '') {
                    const snackBar = SnackBar(
                      content: Text('All details required!'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    vehicleList.value.add(Vehicle(
                        manufacturer: _manufacturerController.text,
                        model: _modelController.text,
                        purchaseYear: _dateSelected,
                        odometer: _odometerController.text));
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                        (r) => false);
                  }
                })
          ],
        ),
      ),
    );
  }
}
