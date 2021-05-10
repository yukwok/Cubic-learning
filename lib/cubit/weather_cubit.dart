import 'package:bloc/bloc.dart';
import 'package:cubic_learning/model/weather.dart';
import 'package:cubic_learning/repo/repository.dart';
import 'package:meta/meta.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
   final Repository _repo;

  WeatherCubit(this._repo) : super(WeatherInitial());


 

  void getWeather() {
    emit(WeatherLoading());
    //delay 1 second

    // get the fake weather data
    final weather = 
    //emit Weatherloaded
    emit(WeatherLoaded(weather))
  }
}
