import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'add_med_screen.dart';
import 'reminders_screen.dart';
import 'health_report_screen.dart';
import 'med_details_screen.dart';
import '/controllers/btm_nav_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final BottomNavController navController = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFF0F1117),
        bottomNavigationBar: _buildBottomNav(),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                const SizedBox(height: 24),
                _buildStats(),
                const SizedBox(height: 24),
                _buildMyMedicines(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 👋 Header
  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'مرحباً محمد!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              'كيف حالك اليوم؟',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ],
        ),
        CircleAvatar(
          radius: 22,
          backgroundColor: const Color(0xFF1A1D26),
          child: const Icon(Icons.person, color: Color(0xFFE6C76A)),
        ),
      ],
    );
  }

  // 📊 Stats cards
  Widget _buildStats() {
    return Row(
      children: [
        Expanded(
          child: _statCard(
            value: '0',
            label: 'تذكير اليوم',
            icon: Icons.notifications_none,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _statCard(
            value: '2',
            label: 'دواء نشط',
            icon: Icons.medication_outlined,
          ),
        ),
      ],
    );
  }

  Widget _statCard({
    required String value,
    required String label,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1D26),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(label, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          Icon(icon, color: const Color(0xFFE6C76A)),
        ],
      ),
    );
  }

  // 💊 My medicines
  Widget _buildMyMedicines() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'أدويتي',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AddMedScreen()),
                );
              },
              icon: const Icon(Icons.add, color: Color(0xFFE6C76A)),
              label: const Text(
                'إضافة دواء',
                style: TextStyle(color: Color(0xFFE6C76A)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        _medicineCard(
          name: 'بانادول',
          dosage: 'قرص واحد 500 ملغ',
          frequency: '3 مرات يومياً',
        ),
        const SizedBox(height: 12),
        _medicineCard(
          name: 'أوميفا 3',
          dosage: 'كبسولة واحدة',
          frequency: 'مرة واحدة يومياً',
        ),
      ],
    );
  }

  Widget _medicineCard({
    required String name,
    required String dosage,
    required String frequency,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => MedDetailsScreen()),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1D26),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(dosage, style: const TextStyle(color: Colors.grey)),
                  const SizedBox(height: 4),
                  Text(
                    frequency,
                    style: const TextStyle(
                      color: Color(0xFFE6C76A),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 36,
              width: 36,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF2A2D36),
              ),
              child: const Icon(Icons.edit, size: 18, color: Color(0xFFE6C76A)),
            ),
          ],
        ),
      ),
    );
  }

  // 🔻 Bottom navigation
  Widget _buildBottomNav() {
    return Obx(
      () => BottomNavigationBar(
        currentIndex: navController.currentIndex.value,
        backgroundColor: const Color(0xFF0F1117),
        selectedItemColor: const Color(0xFFE6C76A),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          navController.changeIndex(index);

          switch (index) {
            case 0:
              Get.offAll(() => const RemindersScreen());
              break;
            case 1:
              Get.offAll(() => const HealthReportScreen());
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
            icon: Icon(Icons.medication),
            label: 'أدويتي',
          ),
        ],
      ),
    );
  }
}
