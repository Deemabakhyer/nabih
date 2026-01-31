import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const RemindersApp());
}

/// -------------------- APP --------------------
class RemindersApp extends StatelessWidget {
  const RemindersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const RemindersScreen(),
    );
  }
}

/// -------------------- MODEL --------------------
enum ReminderStatus { pending, confirmed, missed }

class Reminder {
  final String title;
  final TimeOfDay time;
  ReminderStatus status;
  Timer? autoMissTimer;

  Reminder({
    required this.title,
    required this.time,
    this.status = ReminderStatus.pending,
  });
}

/// -------------------- SCREEN --------------------
class RemindersScreen extends StatefulWidget {
  const RemindersScreen({super.key});

  @override
  State<RemindersScreen> createState() => _RemindersScreenState();
}

class _RemindersScreenState extends State<RemindersScreen> {
  final List<Reminder> reminders = [
    Reminder(title: 'بانادول', time: const TimeOfDay(hour: 14, minute: 0)),
    Reminder(title: 'توميفلا', time: const TimeOfDay(hour: 9, minute: 0)),
  ];

  @override
  void initState() {
    super.initState();
    _startAutoMissLogic();
  }

  void _startAutoMissLogic() {
    for (var reminder in reminders) {
      reminder.autoMissTimer = Timer(
        const Duration(minutes: 30),
        () {
          if (reminder.status == ReminderStatus.pending) {
            setState(() {
              reminder.status = ReminderStatus.missed;
            });
          }
        },
      );
    }
  }

  void _confirmReminder(Reminder reminder) {
    reminder.autoMissTimer?.cancel();
    setState(() {
      reminder.status = ReminderStatus.confirmed;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  child: ListView.builder(
                    itemCount: reminders.length,
                    itemBuilder: (context, index) {
                      return _buildReminderCard(reminders[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// -------------------- UI COMPONENTS --------------------

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
              'في حال عدم تأكيد أخذ الجرعة خلال 30 دقيقة، سيتم التواصل تلقائيًا مع رقم الطوارئ (أحد أفراد العائلة).',
              style: TextStyle(color: Colors.orangeAccent),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReminderCard(Reminder reminder) {
    Color statusColor;
    IconData statusIcon;

    switch (reminder.status) {
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
                Text(
                  reminder.title,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(
                  reminder.time.format(context),
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          if (reminder.status == ReminderStatus.pending)
            IconButton(
              icon: const Icon(Icons.check, color: Colors.amber),
              onPressed: () => _confirmReminder(reminder),
            ),
          if (reminder.status == ReminderStatus.confirmed)
            const Icon(Icons.check, color: Colors.green),
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFF0F1117),
      selectedItemColor: Colors.amber,
      unselectedItemColor: Colors.grey,
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
    );
  }
}
