import 'package:injectable/injectable.dart';
import 'package:weather_app/configs/di.dart';
import 'package:weather_app/core/data_states.dart';
import 'package:weather_app/features/weather/data/model/weather_days_response_model/weather_days_response_model.dart';
import 'package:weather_app/features/weather/data/model/weather_response_model.dart';
import 'package:weather_app/features/weather/data/source/weather_data_source.dart';
import 'package:weather_app/features/weather/domain/repository/weather_repository.dart';

@Injectable(as: IWeatherRepository)
class WeatherRepositoryImpl implements IWeatherRepository {
  @override
  Future<DataState<WeatherResponseModel>> getWeather() async {
    final res = await getIt<IWeatherDataSource>().getWeather();
    if (res != null) {
      return DataSuccess(res);
    } else {
      return DataError("دریافت اطلاعات آب‌وهوا با مشکل مواجه شد.");
    }
  }

  @override
  Future<DataState<WeatherComingDayResponseModel>> getWeatherComingDay() async {
    final res = await getIt<IWeatherDataSource>().getWeatherComingDay();
    if (res != null) {
      return DataSuccess(res);
    } else {
      return DataError("دریافت اطلاعات آب‌وهوا با مشکل مواجه شد.");
    }
  }
}
