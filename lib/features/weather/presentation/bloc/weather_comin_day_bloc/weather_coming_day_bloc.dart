import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/core/data_states.dart';
import 'package:weather_app/features/weather/data/model/weather_days_response_model/weather_days_response_model.dart';
import 'package:weather_app/features/weather/domain/use_cases/weather_coming_day_usecase.dart';

part 'weather_coming_day_event.dart';
part 'weather_coming_day_state.dart';

class WeatherComingDayBloc
    extends Bloc<WeatherComingDayEvent, WeatherComingDayState> {
  WeatherComingDayBloc() : super(WeatherComingDayInitial()) {
    on<WeatherComingDayEvent>((event, emit) async {
      if (event is WeatherComingDayStart) {
        emit(WeatherComingDayLoading());
        final state = await WeatherComingDayUsecase().call();
        if (state is DataSuccess) {
          emit(WeatherComingDayLoaded(model: state.data!));
        }
        if (state is DataError) {
          emit(WeatherComingDayError(message: state.error!));
        }
      }
    });
  }
}
