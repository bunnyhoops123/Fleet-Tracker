import 'dart:ui';

import 'package:fleettrack/data/vehicledata.dart';
import 'package:fleettrack/models/vehicelclass.dart';
import 'package:fleettrack/pages/documentspage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/src/intl/date_format.dart';

class VehicleInfo extends StatefulWidget {
  final Vehicle vehicle;
  const VehicleInfo({required this.vehicle, super.key});

  @override
  State<VehicleInfo> createState() => _VehicleInfoState();
}

class _VehicleInfoState extends State<VehicleInfo> {
  TextEditingController _odometerController = TextEditingController();
  TextEditingController _fuelController = TextEditingController();
  TextEditingController _fuelCostController = TextEditingController();
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

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) =>
                        DocumentsPage(vehicle: widget.vehicle)),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: Card(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
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
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              width: MediaQuery.of(context).size.width * 0.95,
              height: MediaQuery.of(context).size.height * 0.15,
              child: Row(
                children: [
                  //Fuel card
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        elevation: 5,
                        backgroundColor: Colors.grey[300],
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          // <-- SEE HERE
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(40.0),
                          ),
                        ),
                        context: context,
                        builder: ((context) {
                          return SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  margin: const EdgeInsets.only(
                                      top: 20, left: 10, right: 10),
                                  child: Padding(
                                    padding: MediaQuery.of(context).viewInsets,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          color: Colors.white,
                                          margin: const EdgeInsets.only(
                                              top: 20, left: 10, right: 10),
                                          child: TextField(
                                            controller: _fuelController,
                                            keyboardType: TextInputType.number,
                                            // inputFormatters: [
                                            //   FilteringTextInputFormatter
                                            //       .digitsOnly
                                            // ],
                                            autofocus: false,
                                            style: const TextStyle(
                                                color: Colors.black),
                                            decoration: InputDecoration(
                                                enabled: true,
                                                enabledBorder:
                                                    const OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            width: 3,
                                                            color:
                                                                Colors.black)),
                                                focusedBorder:
                                                    const OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            width: 3,
                                                            color:
                                                                Colors.black)),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                labelText:
                                                    'Litres of fuel filled',
                                                labelStyle: const TextStyle(
                                                    color: Colors.black),
                                                hintText: 'Required'),
                                          ),
                                        ),
                                        Container(
                                          color: Colors.white,
                                          margin: const EdgeInsets.only(
                                              top: 20, left: 10, right: 10),
                                          child: TextField(
                                            controller: _fuelCostController,
                                            keyboardType: TextInputType.number,
                                            inputFormatters: [
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            autofocus: false,
                                            style: const TextStyle(
                                                color: Colors.black),
                                            decoration: InputDecoration(
                                                enabled: true,
                                                enabledBorder:
                                                    const OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            width: 3,
                                                            color:
                                                                Colors.black)),
                                                focusedBorder:
                                                    const OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            width: 3,
                                                            color:
                                                                Colors.black)),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                labelText: 'Enter Cost',
                                                labelStyle: const TextStyle(
                                                    color: Colors.black),
                                                hintText: 'Required'),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            //update fuel and cost
                                            if (_fuelController.text == '' ||
                                                _fuelCostController.text ==
                                                    '') {
                                            } else {
                                              setState(() {
                                                widget.vehicle.fuel +=
                                                    double.parse(
                                                        _fuelController.text);
                                                widget.vehicle.fuelCost +=
                                                    int.parse(
                                                        _fuelCostController
                                                            .text);
                                              });
                                              _fuelController.text = '';
                                              _fuelCostController.text = '';

                                              Navigator.pop(context);
                                            }
                                          },
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.07,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.75,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            margin: const EdgeInsets.only(
                                                top: 20, bottom: 30),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Colors.white,
                                                border: Border.all(width: 3)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Enter',
                                                  style: GoogleFonts.outfit(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 22,
                                                      wordSpacing: 2,
                                                      color: Colors.black,
                                                      letterSpacing: 1),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                const Icon(
                                                    Icons.arrow_right_alt)
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      );
                    },
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
                          Text(
                            '${(widget.vehicle.odometer / widget.vehicle.fuel).roundToDouble()} Kmpl',
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
                    ),
                  )),
                  const SizedBox(
                    width: 5,
                  ),
                  //Odometer card
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        elevation: 5,
                        backgroundColor: Colors.grey[300],
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          // <-- SEE HERE
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(40.0),
                          ),
                        ),
                        context: context,
                        builder: ((context) {
                          return SingleChildScrollView(
                            child: Container(
                              color: Colors.transparent,
                              margin: const EdgeInsets.only(
                                  top: 20, left: 10, right: 10),
                              child: Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      color: Colors.white,
                                      margin: const EdgeInsets.only(
                                          top: 20, left: 10, right: 10),
                                      child: TextField(
                                        controller: _odometerController,
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        autofocus: false,
                                        style: const TextStyle(
                                            color: Colors.black),
                                        decoration: InputDecoration(
                                            enabled: true,
                                            enabledBorder:
                                                const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        width: 3,
                                                        color: Colors.black)),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        width: 3,
                                                        color: Colors.black)),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            labelText: 'Enter Reading',
                                            labelStyle: const TextStyle(
                                                color: Colors.black),
                                            hintText: 'Enter a valid number'),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        //update odometer reading
                                        setState(() {
                                          widget.vehicle.odometer = int.parse(
                                              _odometerController.text);
                                        });

                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.07,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.75,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        margin: const EdgeInsets.only(
                                            top: 20, bottom: 30),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.white,
                                            border: Border.all(width: 3)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Enter',
                                              style: GoogleFonts.outfit(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22,
                                                  wordSpacing: 2,
                                                  color: Colors.black,
                                                  letterSpacing: 1),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Icon(Icons.arrow_right_alt)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      );
                    },
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
                            '${widget.vehicle.odometer.toString()} Km',
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
                    ),
                  ))
                ],
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.95,
                height: MediaQuery.of(context).size.height * 0.1,
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 2),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'EMI',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      Container(
                        child: CircularProgressIndicator(
                          color: Colors.black,
                          value: 0.3,
                        ),
                      )
                    ])),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      //open notes list
                    },
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
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                vehicleList.remove(widget.vehicle);
                print(vehicleList.length);
                Navigator.pushNamedAndRemoveUntil(
                    context, '/homepage', (route) => false);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                    color: Colors.red,
                    border: Border.all(width: 2),
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  'Delete Vehicle',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
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
