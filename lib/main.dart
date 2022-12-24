import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_animation_app/app_types.dart';
import 'package:flutter_animation_app/the_avengers_app/the_avengers_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _animationAppTitle(AppType.avengers),
      home: _animationAppsFactory(AppType.avengers),
    );
  }

  Widget _animationAppsFactory(AppType appType) {
    switch (appType) {
      case AppType.avengers:
        return const TheAvengersApp();
    }
  }

  String _animationAppTitle(AppType appType) {
    switch (appType) {
      case AppType.avengers:
        return 'The Avengers';
    }
  }
}
