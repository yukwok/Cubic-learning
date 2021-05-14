part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {
  final String dummyString = 'dummy';
}

class GetWeather extends WeatherEvent {
  final String cityName;

  GetWeather(this.cityName);
}
