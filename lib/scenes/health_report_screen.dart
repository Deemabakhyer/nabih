// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_screen.dart';
import 'reminders_screen.dart';

class HealthReportScreen extends StatelessWidget {
  const HealthReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Get.back(), // ✅ GetX back
          ),
          title: const Column(
            children: [
              Text(
                'التقرير الصحي',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                'للطوارئ والحالات الإسعافية',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
          centerTitle: true,
        ),

        bottomNavigationBar: _buildBottomNav(),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildInfoBanner(),
              const SizedBox(height: 16),
              _buildQrCard(),
              const SizedBox(height: 16),
              _buildHealthSummary(),
              const SizedBox(height: 16),
              _buildEmergencyContact(),
              const SizedBox(height: 16),
              _buildWarningBanner(),
            ],
          ),
        ),
      ),
    );
  }

  // 🔵 Info banner
  Widget _buildInfoBanner() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF14233D),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: const [
          Icon(Icons.info_outline, color: Colors.lightBlueAccent),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              'يمكنك مشاركة هذا الرمز مع الطاقم الطبي في حالات الطوارئ للحصول على معلوماتك الصحية بسرعة',
              style: TextStyle(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  // 🟨 QR card
  Widget _buildQrCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1D26),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const Text(
            'رمز التقرير الصحي',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            'امسح الرمز للحصول على المعلومات الطبية',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 16),
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white, width: 6),
            ),
            child: const Center(
              child: Icon(Icons.qr_code_2, size: 120, color: Color(0xFFFFD54F)),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _actionButton(Icons.download, 'تنزيل')),
              const SizedBox(width: 12),
              Expanded(child: _actionButton(Icons.share, 'مشاركة')),
            ],
          ),
        ],
      ),
    );
  }

  Widget _actionButton(IconData icon, String label) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: const Color(0xFF12141A),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 18, color: const Color(0xFFFFD54F)),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(color: Color(0xFFFFD54F))),
        ],
      ),
    );
  }

  // 📋 Health summary
  Widget _buildHealthSummary() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1D26),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'ملخص المعلومات الصحية',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          _infoRow('عدد الأدوية', '2'),
          const SizedBox(height: 12),
          _chipRow('الحساسية', ['البنسلين'], Colors.redAccent),
          const SizedBox(height: 12),
          _chipRow('الحالات المرضية', ['ضغط الدم', 'السكري'], Colors.amber),
        ],
      ),
    );
  }

  Widget _infoRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(color: Colors.grey)),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _chipRow(String title, List<String> items, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: items
              .map(
                (e) => Chip(
                  label: Text(e),
                  backgroundColor: color.withOpacity(0.2),
                  labelStyle: TextStyle(color: color),
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  // ☎ Emergency contact
  Widget _buildEmergencyContact() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1D26),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: const [
          Text(
            'رقم الطوارئ (سند)',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          SizedBox(height: 8),
          Text(
            '+966 50 123 4567',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // ⚠ Warning
  Widget _buildWarningBanner() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: const [
          Icon(Icons.warning_amber, color: Colors.orange),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              'تأكد من تحديث معلوماتك الطبية بانتظام للحفاظ على دقة البيانات',
              style: TextStyle(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  // 🔻 Bottom Navigation
  Widget _buildBottomNav() {
  return BottomNavigationBar(
    currentIndex: 1,
    backgroundColor: const Color(0xFF0F1117),
    selectedItemColor: const Color(0xFFFFD54F),
    unselectedItemColor: Colors.grey,
    onTap: (index) {
      switch (index) {
        case 0:
          Get.offAll(() => const RemindersScreen());
          break;
        case 1:
          // أنتِ بالفعل هنا – لا شي
          break;
        case 2:
          Get.offAll(() => const HomeScreen());
          break;
      }
    },
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.notifications),
        label: 'التذكيرات',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.qr_code),
        label: 'التقرير الصحي',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.edit),
        label: 'أدويتي',
      ),
    ],
  );
}

  }

