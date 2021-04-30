import 'dart:math';

import 'package:cubic_learning/model/weather.dart';

abstract class Repository {
  Future<Weather> fetchWeather(String cityName);
}

class FakeRepository implements Repository {
  Future<Weather> fetchWeather(String cityname) async {
    return Future.delayed(Duration(seconds: 1), () {
      var random = Random();

      if (random.nextBool()) {
        //generate the random network problem
        throw NetworkException();
      }

      double randomTemp = random.nextInt(30) + random.nextDouble();
      print('random temperature = $randomTemp.');
      return Weather(cityName: cityname, temperatureCelsius: randomTemp);
    });
  }
}

class NetworkException implements Exception {}
