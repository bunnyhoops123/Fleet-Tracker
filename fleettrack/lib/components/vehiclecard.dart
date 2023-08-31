import 'package:fleettrack/models/vehicelclass.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                      padding: const EdgeInsets.only(left: 30),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        vehicle.model,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      )),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text('2019'),
              )
            ],
          ),
          Container(
            color: Colors.transparent,
            child: Image.asset(vehicle.imagePath),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('Fuel Economy:20Kmpl'),
              Text('Odometer: ${vehicle.odometer} Km')
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            margin: const EdgeInsets.symmetric(vertical: 5),
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
          )
        ],
      ),
    );
  }
}
