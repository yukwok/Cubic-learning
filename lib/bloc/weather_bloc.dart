import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cubic_learning/model/weather.dart';
import 'package:cubic_learning/repo/repository.dart';
import 'package:meta/meta.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final Repository _repo;

  WeatherBloc(this._repo) : super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    print('in mapEventtoState function');

    if (event is GetWeather) {
      try {
        yield WeatherLoading();

        // get the fake weather data
        final weather = await _repo.fetchWeather(event.cityName);
        //emit Weatherloaded
        yield WeatherLoaded(weather);
        return;
      } on NetworkException {
        yield WeatherError('no internet. Data not fetched.');
      }
    }
  }
}
