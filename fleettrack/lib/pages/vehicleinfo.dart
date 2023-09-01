import 'package:fleettrack/models/vehicelclass.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/src/intl/date_format.dart';

class VehicleInfo extends StatefulWidget {
  final Vehicle vehicle;
  const VehicleInfo({required this.vehicle, super.key});

  @override
  State<VehicleInfo> createState() => _VehicleInfoState();
}

class _VehicleInfoState extends State<VehicleInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: Text(
          widget.vehicle.model,
          style: GoogleFonts.dmSans(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //image
            Image.asset('assets/car_images/model3.png'),

            //info card
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: Card(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Purchased on: ${DateFormat().add_yM().format(widget.vehicle.purchaseYear!)}',
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        widget.vehicle.manufacturer,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: Card(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Icon(Icons.article_outlined),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Documents'),
                      Spacer(),
                      Icon(Icons.arrow_forward)
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              width: MediaQuery.of(context).size.width * 0.95,
              height: MediaQuery.of(context).size.height * 0.15,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        border: Border.all(width: 2)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Fuel Economy',
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                        const Text(
                          '20.00 Kmpl',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        const Text(
                          'Add Data/View History >',
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        )
                      ],
                    ),
                  )),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        border: Border.all(width: 2)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Odometer',
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                        Text(
                          '${widget.vehicle.odometer} Km',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        const Text(
                          'Update Reading >',
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(width: 2)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: const Text(
                      'Notes',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            )

            // Container(
            //   child: GridView.count(
            //     shrinkWrap: true,
            //     children: [Container()],
            //     crossAxisCount: 2,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
