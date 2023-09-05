import 'package:fleettrack/components/vehiclecard.dart';
import 'package:fleettrack/data/vehicledata.dart';
import 'package:fleettrack/models/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _vehicleBox = Hive.box('vehicleBox');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _vehicleBox.get('TODOLIST');
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Container(),
          centerTitle: true,
          title: Text(
            'Fleet Track',
            style: GoogleFonts.dmSerifDisplay(fontSize: 30),
          ),
        ),
        body: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text('My Fleet',
                        style: GoogleFonts.roboto(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 15),
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: MediaQuery.of(context).size.height * 0.75,
                  decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(10)),
                  child: (vehicleList.length != 0)
                      ? ListView.builder(
                          itemCount: vehicleList.length,
                          itemBuilder: (context, index) {
                            return VehicleCard(
                              vehicle: vehicleList[index],
                            );
                          },
                        )
                      : Center(
                          child: Text(
                            "No vehicles in your fleet yet..",
                            style: GoogleFonts.dmSans(fontSize: 20),
                          ),
                        ),
                )
              ],
            )),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.grey[200],
          onPressed: () {
            Navigator.of(context).pushNamed('/addvehicle');
          },
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
