import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/core/data_states.dart';
import 'package:weather_app/features/weather/data/model/weather_response_model.dart';
import 'package:weather_app/features/weather/domain/use_cases/weather_usecase.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) async {
      if (event is WeatherStart) {
        emit(WeatherLoading());
        final state = await WeatherUsecase().call();
        if (state is DataSuccess) {
          emit(WeatherLoaded(model: state.data!));
        }
        if (state is DataError) {
          emit(WeatherError(message: state.error!));
        }
      }
    });
  }
}
