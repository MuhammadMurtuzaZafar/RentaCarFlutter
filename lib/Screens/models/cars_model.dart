// To parse this JSON data, do
//
//     final cars = carsFromJson(jsonString);

import 'dart:convert';

List<Cars> carsFromJson(String str) => List<Cars>.from(json.decode(str).map((x) => Cars.fromJson(x)));

String carsToJson(List<Cars> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cars {
  Cars({
    required this.carId,
    required this.carName,
    required this.carMake,
    required this.carModel,
    required this.carPrice,
    required this.seats,
    required this.doors,
    required this.driver,
    required this.transmission,
    required this.fuel,
    required this.speed,
    required this.carGallery,
  });

  String carId;
  String carName;
  String carMake;
  String carModel;
  String carPrice;
  String seats;
  String doors;
  String driver;
  String transmission;
  String fuel;
  String speed;
  List<CarGallery> carGallery;

  factory Cars.fromJson(Map<String, dynamic> json) => Cars(
    carId: json["car_id"],
    carName: json["car_name"],
    carMake: json["car_make"],
    carModel: json["car_model"],
    carPrice: json["car_price"],
    seats: json["seats"],
    doors: json["doors"],
    driver: json["driver"],
    transmission: json["transmission"],
    fuel: json["fuel"],
    speed: json["speed"],
    carGallery: List<CarGallery>.from(json["car_gallery"].map((x) => CarGallery.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "car_id": carId,
    "car_name": carName,
    "car_make": carMake,
    "car_model": carModel,
    "car_price": carPrice,
    "seats": seats,
    "doors": doors,
    "driver": driver,
    "transmission": transmission,
    "fuel": fuel,
    "speed": speed,
    "car_gallery": List<dynamic>.from(carGallery.map((x) => x.toJson())),
  };
}

class CarGallery {
  CarGallery({
    required this.ciImage,
  });

  String ciImage;

  factory CarGallery.fromJson(Map<String, dynamic> json) => CarGallery(
    ciImage: json["ci_image"],
  );

  Map<String, dynamic> toJson() => {
    "ci_image": ciImage,
  };
}

enum Driver { YES }




