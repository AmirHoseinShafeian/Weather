part of 'weather_coming_day_bloc.dart';

@immutable
sealed class WeatherComingDayEvent {}

class WeatherComingDayStart extends WeatherComingDayEvent {}
