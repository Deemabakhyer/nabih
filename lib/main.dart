import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabih_app/scenes/login_screen.dart';
import 'scenes/home_screen.dart';
import 'scenes/health_report_screen.dart';
import 'scenes/reminders_screen.dart';
import 'scenes/add_med_screen.dart';
import 'scenes/med_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar'),
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Cairo',
        scaffoldBackgroundColor: const Color(0xFF0F1117),
      ),
      home: const LoginScreen(),
      getPages: [
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(name: '/health-report', page: () => HealthReportScreen()),
        GetPage(name: '/reminders', page: () => RemindersScreen()),
        GetPage(name: '/add-med', page: () => AddMedScreen()),
        GetPage(name: '/med-details', page: () => MedDetailsScreen()),
      ],
    );
  }
}
