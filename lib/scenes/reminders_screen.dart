import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'health_report_screen.dart';
import '../controllers/reminders_controller.dart';
import 'home_screen.dart';

class RemindersScreen extends StatelessWidget {
  const RemindersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RemindersController());

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFF0F1117),
        bottomNavigationBar: _buildBottomNav(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'التذكيرات',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                const Text(
                  'لديك 1 تذكير لم يتم تأكيده بعد',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 20),
                _buildWarningCard(),
                const SizedBox(height: 20),
                const Text(
                  'التذكيرات القادمة',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: Obx(
                    () => ListView.builder(
                      itemCount: controller.reminders.length,
                      itemBuilder: (context, index) {
                        return _buildReminderCard(
                          controller,
                          controller.reminders[index],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// ---------------- UI ----------------

  Widget _buildWarningCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF3A2415),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: const [
          Icon(Icons.warning_amber_rounded, color: Colors.orange),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              'في حال عدم تأكيد أخذ الجرعة خلال 30 دقيقة، سيتم التواصل تلقائيًا مع رقم الطوارئ.',
              style: TextStyle(color: Colors.orangeAccent),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReminderCard(RemindersController controller, Reminder reminder) {
    return Obx(() {
      Color statusColor;
      IconData statusIcon;

      switch (reminder.status.value) {
        case ReminderStatus.confirmed:
          statusColor = Colors.green;
          statusIcon = Icons.check_circle;
          break;
        case ReminderStatus.missed:
          statusColor = Colors.redAccent;
          statusIcon = Icons.error;
          break;
        default:
          statusColor = Colors.amber;
          statusIcon = Icons.notifications_active;
      }

      return Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1C22),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Icon(statusIcon, color: statusColor),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(reminder.title, style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 4),
                  Text(
                    reminder.time.format(Get.context!),
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            if (reminder.status.value == ReminderStatus.pending)
              IconButton(
                icon: const Icon(Icons.check, color: Colors.amber),
                onPressed: () => controller.confirmReminder(reminder),
              ),
            if (reminder.status.value == ReminderStatus.confirmed)
              const Icon(Icons.check, color: Colors.green),
          ],
        ),
      );
    });
  }

  /// ---------------- Bottom Nav ----------------

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      currentIndex: 0,
      backgroundColor: const Color(0xFF0F1117),
      selectedItemColor: Colors.amber,
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        switch (index) {
          case 0:
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
        BottomNavigationBarItem(icon: Icon(Icons.medication), label: 'أدويتي'),
      ],
    );
  }
}
