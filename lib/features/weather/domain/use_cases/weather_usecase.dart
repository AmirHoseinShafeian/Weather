import 'package:weather_app/configs/di.dart';
import 'package:weather_app/core/data_states.dart';
import 'package:weather_app/core/use_case.dart';
import 'package:weather_app/features/weather/data/model/weather_response_model.dart';
import 'package:weather_app/features/weather/domain/repository/weather_repository.dart';

class WeatherUsecase extends TUseCase<DataState<WeatherResponseModel>> {
  @override
  Future<DataState<WeatherResponseModel>> call() =>
      getIt<IWeatherRepository>().getWeather();
}
