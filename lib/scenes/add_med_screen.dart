import 'package:flutter/material.dart';

class AddMedScreen extends StatelessWidget {
  const AddMedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('إضافة دواء جديد')),
      body: const Center(child: Text('محتوى إضافة الدواء هنا')),
    );
  }
}