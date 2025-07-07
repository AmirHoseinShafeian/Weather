import 'package:weather_app/core/data_states.dart';
import 'package:weather_app/features/weather/data/model/weather_days_response_model/weather_days_response_model.dart';
import 'package:weather_app/features/weather/data/model/weather_response_model.dart';

abstract class IWeatherRepository {
  Future<DataState<WeatherResponseModel>> getWeather();
  Future<DataState<WeatherComingDayResponseModel>> getWeatherComingDay();
}
