import 'package:flutter/material.dart';
// import 'scenes/login_screen.dart';
// import 'scenes/home_screen.dart';
// import 'scenes/health_report_screen.dart';
import 'scenes/reminders_screen.dart';
// import 'scenes/add_med_screen.dart';
// import 'scenes/med_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar'),
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Cairo',
        scaffoldBackgroundColor: const Color(0xFF0F1117),
      ),
      home: const RemindersScreen(),
    );
  }
}
