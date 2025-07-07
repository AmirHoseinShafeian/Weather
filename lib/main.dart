import 'package:flutter/material.dart';
import 'package:weather_app/configs/di.dart';
import 'package:weather_app/configs/theme.dart';
import 'package:weather_app/features/weather/presentation/screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'weather',
      theme: myTheme(),
      builder: (context, ui) => MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(1.0)),
          child: ui!),
      home: const HomeScreen(),
    );
  }
}
