part of 'weather_coming_day_bloc.dart';

@immutable
sealed class WeatherComingDayState {}

final class WeatherComingDayInitial extends WeatherComingDayState {}

final class WeatherComingDayLoading extends WeatherComingDayState {}

final class WeatherComingDayLoaded extends WeatherComingDayState {
  final WeatherComingDayResponseModel model;

  WeatherComingDayLoaded({required this.model});
}

final class WeatherComingDayError extends WeatherComingDayState {
  final String message;

  WeatherComingDayError({required this.message});
}
