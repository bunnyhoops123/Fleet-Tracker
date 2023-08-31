class Vehicle {
  final String manufacturer;
  final String model;
  final int purchaseYear;
  final String imagePath = 'assets/car_images/model3.png';
  final String odometer;
  Vehicle(
      {required this.manufacturer,
      required this.model,
      required this.purchaseYear,
      required this.odometer});
}
