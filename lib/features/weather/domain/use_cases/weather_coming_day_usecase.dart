import 'package:weather_app/configs/di.dart';
import 'package:weather_app/core/data_states.dart';
import 'package:weather_app/core/use_case.dart';
import 'package:weather_app/features/weather/data/model/weather_days_response_model/weather_days_response_model.dart';
import 'package:weather_app/features/weather/domain/repository/weather_repository.dart';

class WeatherComingDayUsecase
    extends TUseCase<DataState<WeatherComingDayResponseModel>> {
  @override
  Future<DataState<WeatherComingDayResponseModel>> call() =>
      getIt<IWeatherRepository>().getWeatherComingDay();
}
