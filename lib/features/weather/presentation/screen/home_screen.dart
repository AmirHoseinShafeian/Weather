import 'package:flutter/material.dart';
import 'package:weather_app/configs/gen/assets.gen.dart';
import 'package:weather_app/core/custom_modals.dart';
import 'package:weather_app/core/extentions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/weather/presentation/bloc/weather_bloc/weather_bloc.dart';
import 'package:weather_app/features/weather/presentation/widget/weather_detail_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AssetGenImage getBackgroundByTime() {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return Assets.resource.noon;
    } else if (hour >= 12 && hour < 18) {
      return Assets.resource.afternoon;
    } else {
      return Assets.resource.night;
    }
  }

  @override
  Widget build(BuildContext context) {
    final backgroundImage = getBackgroundByTime();
    return BlocProvider(
      create: (context) => WeatherBloc()..add(WeatherStart()),
      child: Scaffold(
        body: BlocConsumer<WeatherBloc, WeatherState>(
          listener: (context, state) {
            if (state is WeatherError) {
              CustomModal.showError(context, state.message);
            }
          },
          builder: (context, state) {
            if (state is WeatherLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return state is WeatherLoaded
                ? Stack(
                    children: [
                      Positioned.fill(
                        child: backgroundImage.image(
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 100,
                        left: 30,
                        right: 30,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '${state.model.current?.tempC ?? 30}°C',
                                      style: TextStyle(
                                        fontSize: 40,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                10.hsb(),
                                Row(
                                  children: [
                                    Icon(Icons.location_on,
                                        size: 16, color: Colors.white),
                                    4.wsb(),
                                    Text(
                                      state.model.location!.name ?? "Iran",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                          top: 55.h(context),
                          left: 20,
                          right: 20,
                          child: WeatherDetailWidget()),
                    ],
                  )
                : Center(
                    child: Text('Error'),
                  );
          },
        ),
      ),
    );
  }
}
