import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/configs/color_palette.dart';
import 'package:weather_app/core/custom_modals.dart';
import 'package:weather_app/core/extentions.dart';
import 'package:weather_app/features/weather/presentation/bloc/weather_comin_day_bloc/weather_coming_day_bloc.dart';

class WeatherDetailWidget extends StatefulWidget {
  const WeatherDetailWidget({super.key});

  @override
  State<WeatherDetailWidget> createState() => _WeatherDetailWidgetState();
}

class _WeatherDetailWidgetState extends State<WeatherDetailWidget> {
  String _getWeekdayName(int weekday) {
    const days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    return days[weekday - 1];
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherComingDayBloc()..add(WeatherComingDayStart()),
      child: BlocConsumer<WeatherComingDayBloc, WeatherComingDayState>(
        listener: (context, state) {
          if (state is WeatherComingDayError) {
            CustomModal.showError(context, state.message);
          }
        },
        builder: (context, state) {
          if (state is WeatherComingDayLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return state is WeatherComingDayLoaded
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Text(
                        'Low of 23 degrees, very clear skies.',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 14),
                      ),
                    ),
                    Divider(
                      color: ColorPalette.fontColor1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      child: SizedBox(
                        height: 100,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: state
                              .model.forecast!.forecastday!.first.hour!.length,
                          separatorBuilder: (_, __) => 16.wsb(),
                          itemBuilder: (context, index) {
                            final hourData = state.model.forecast!.forecastday!
                                .first.hour![index];
                            final time = DateTime.parse(hourData.time!);
                            final hour =
                                '${time.hour.toString().padLeft(2, '0')}:00';

                            final iconUrl = 'https:${hourData.condition!.icon}';

                            final temperature =
                                '${(hourData.tempC as num).toStringAsFixed(1)} ํ';

                            return _dailyWeatherDetails(
                              hour,
                              Image.network(
                                iconUrl,
                                width: 36,
                                height: 36,
                              ),
                              temperature,
                            );
                          },
                        ),
                      ),
                    ),
                    Center(
                        child: Text(
                      'Tomorrow`s temperature',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    )),
                    6.hsb(),
                    Center(
                        child: Text(
                      'Almost equal to today',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                    )),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        itemCount:
                            state.model.forecast?.forecastday?.length ?? 0,
                        itemBuilder: (context, index) {
                          final forecastItem =
                              state.model.forecast!.forecastday![index];
                          final date = DateTime.parse(forecastItem.date!);

                          final day = index == 0
                              ? 'Today'
                              : _getWeekdayName(date.weekday);

                          final maxTemp =
                              '${forecastItem.day?.maxtempC?.toStringAsFixed(1) ?? '--'} ํ';
                          final minTemp =
                              '${forecastItem.day?.mintempC?.toStringAsFixed(1) ?? '--'} ํ';

                          final iconUrl =
                              'https:${forecastItem.day?.condition?.icon ?? ''}';

                          final iconWidget = Image.network(
                            iconUrl,
                            width: 24,
                            height: 24,
                            errorBuilder: (context, error, stackTrace) =>
                                Icon(Icons.error),
                          );

                          return _weatherComingDays(
                            day,
                            iconWidget,
                            maxTemp,
                            minTemp,
                          );
                        },
                      ),
                    ),
                  ],
                )
              : Center(
                  child: Text('Error'),
                );
        },
      ),
    );
  }

  Padding _weatherComingDays(
      String day, Image icon, String maxTemperature, String minTemperature) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            day,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
          Row(
            children: [
              icon,
              20.wsb(),
              Text(
                maxTemperature,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
              6.wsb(),
              Text(
                minTemperature,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ],
          )
        ],
      ),
    );
  }

  Column _dailyWeatherDetails(String time, Image icon, String temperature) {
    return Column(
      children: [
        Text(
          time,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        ),
        6.hsb(),
        icon,
        6.hsb(),
        Text(
          temperature,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
