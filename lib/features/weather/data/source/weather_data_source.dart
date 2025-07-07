import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/configs/di.dart';
import 'package:weather_app/core/const.dart';
import 'package:weather_app/features/weather/data/model/weather_days_response_model/weather_days_response_model.dart';
import 'package:weather_app/features/weather/data/model/weather_response_model.dart';

abstract class IWeatherDataSource {
  Future<WeatherResponseModel?> getWeather();
  Future<WeatherComingDayResponseModel?> getWeatherComingDay();
}

@Injectable(as: IWeatherDataSource)
class WeatherDataSource implements IWeatherDataSource {
  @override
  Future<WeatherResponseModel?> getWeather() async {
    try {
      final dio = getIt<Dio>(instanceName: appBaseUrlInstantName);
      final response = await dio.get(
        "http://api.weatherapi.com/v1/current.json",
        queryParameters: {
          'key': '3b799113433d43e6a2e63023252906',
          'q': 'Babol',
          'aqi': 'no',
        },
      );

      if (response.statusCode == 200 && response.data != null) {
        return WeatherResponseModel.fromJson(response.data);
      } else {
        debugPrint("خطا در پاسخ: ${response.statusMessage}");
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<WeatherComingDayResponseModel?> getWeatherComingDay() async {
    try {
      final dio = getIt<Dio>(instanceName: appBaseUrlInstantName);
      final response = await dio.get(
        "http://api.weatherapi.com/v1/forecast.json",
        queryParameters: {
          'key': '3b799113433d43e6a2e63023252906',
          'q': 'Babol',
          'days': '5',
        },
      );

      if (response.statusCode == 200 && response.data != null) {
        return WeatherComingDayResponseModel.fromJson(response.data);
      } else {
        debugPrint("خطا در پاسخ: ${response.statusMessage}");
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
