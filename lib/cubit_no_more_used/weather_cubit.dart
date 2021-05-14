import 'package:bloc/bloc.dart';
import 'package:cubic_learning/model/weather.dart';
import 'package:cubic_learning/repo/repository.dart';
import 'package:meta/meta.dart';

part 'weather_state.dart';

/// commit

class WeatherCubit extends Cubit<WeatherState> {
  final Repository _repo;

  WeatherCubit(this._repo) : super(WeatherInitial());

  void getWeather(String cityName) async {
    try {
      emit(WeatherLoading());

      // get the fake weather data
      final weather = await _repo.fetchWeather(cityName);
      //emit Weatherloaded
      emit(WeatherLoaded(weather));
      return;
    } on NetworkException {
      emit(WeatherError('no internet. Data not fetched.'));
    }
  }
}
