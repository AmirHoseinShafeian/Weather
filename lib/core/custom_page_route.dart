import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/configs/color_palette.dart';

class CustomPageRoute<T> extends PageRoute<T> {
  CustomPageRoute(this.child);
  @override
  // TODO: implement barrierColor
  Color get barrierColor => ColorPalette.background;

  @override
  String? get barrierLabel => null;

  final Widget child;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: ColorPalette.primary));
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);
}

class CustomPageRoute2 extends MaterialPageRoute {
  CustomPageRoute2({required WidgetBuilder builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => Duration(milliseconds: 700);
}
