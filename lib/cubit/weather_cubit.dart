import 'package:bloc/bloc.dart';
import 'package:cubic_learning/model/weather.dart';
import 'package:meta/meta.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  void getWeather() {
    emit(WeatherLoading());
    //delay 1 second

    //emit Weatherloaded
  }
}
