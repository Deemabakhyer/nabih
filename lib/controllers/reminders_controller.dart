import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum ReminderStatus { pending, confirmed, missed }

class Reminder {
  final String title;
  final TimeOfDay time;
  var status = ReminderStatus.pending.obs;
  Timer? autoMissTimer;

  Reminder({required this.title, required this.time});
}

class RemindersController extends GetxController {
  final reminders = <Reminder>[
    Reminder(title: 'بانادول', time: const TimeOfDay(hour: 14, minute: 0)),
    Reminder(title: 'توميفلا', time: const TimeOfDay(hour: 9, minute: 0)),
  ].obs;

  @override
  void onInit() {
    super.onInit();
    _startAutoMissLogic();
  }

  void _startAutoMissLogic() {
    for (var reminder in reminders) {
      reminder.autoMissTimer = Timer(const Duration(minutes: 30), () {
        if (reminder.status.value == ReminderStatus.pending) {
          reminder.status.value = ReminderStatus.missed;
        }
      });
    }
  }

  void confirmReminder(Reminder reminder) {
    reminder.autoMissTimer?.cancel();
    reminder.status.value = ReminderStatus.confirmed;
  }

  @override
  void onClose() {
    for (var r in reminders) {
      r.autoMissTimer?.cancel();
    }
    super.onClose();
  }
}
