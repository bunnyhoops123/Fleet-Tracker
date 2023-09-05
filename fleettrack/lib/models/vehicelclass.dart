class Vehicle {
  final String manufacturer;
  final String model;
  final DateTime? purchaseYear;
  final String imagePath = 'assets/car_images/model3.png';
  int odometer;
  double fuel = 1;
  int fuelCost = 0;
  Vehicle(
      {required this.manufacturer,
      required this.model,
      required this.purchaseYear,
      required this.odometer});
}
