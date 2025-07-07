part of 'weather_bloc.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState {}

final class WeatherLoaded extends WeatherState {
  final WeatherResponseModel model;

  WeatherLoaded({required this.model});
}

final class WeatherError extends WeatherState {
  final String message;

  WeatherError({required this.message});
}
