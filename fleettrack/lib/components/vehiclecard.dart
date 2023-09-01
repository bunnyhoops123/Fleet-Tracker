import 'package:fleettrack/models/vehicelclass.dart';
import 'package:fleettrack/pages/vehicleinfo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/src/intl/date_format.dart';

class VehicleCard extends StatelessWidget {
  final Vehicle vehicle;

  const VehicleCard({required this.vehicle, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1),
          borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.only(bottom: 10, top: 5),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                      padding: const EdgeInsets.only(left: 10),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        vehicle.manufacturer.toUpperCase(),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      )),
                  const SizedBox(
                    height: 7,
                  ),
                  Container(
                      padding: const EdgeInsets.only(left: 10),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        vehicle.model.toUpperCase(),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child:
                    Text(DateFormat().add_yM().format(vehicle.purchaseYear!)),
              )
            ],
          ),
          Container(
            color: Colors.transparent,
            child: Image.asset(vehicle.imagePath),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     const Text('Fuel Economy:20Kmpl'),
          //     Text('Odometer: ${vehicle.odometer} Km')
          //   ],
          // ),
          // const SizedBox(
          //   height: 10,
          // ),
          GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Center(
                        child: CircularProgressIndicator(
                      color: Colors.black,
                    ));
                  });
              Future.delayed(Duration(milliseconds: 200), () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => VehicleInfo(vehicle: vehicle)));
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.symmetric(vertical: 0),
              width: MediaQuery.of(context).size.width * 0.4,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'View More',
                    style: GoogleFonts.dmSerifDisplay(fontSize: 15),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(Icons.arrow_forward)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
