import 'package:firstappofmine/home_screen.dart';
import 'package:flutter/material.dart';

class WaterTrackerApp extends StatelessWidget {
  const WaterTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
