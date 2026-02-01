import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MedDetailsScreen extends StatelessWidget {
  const MedDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0F1117),
        textTheme: GoogleFonts.cairoTextTheme(ThemeData.dark().textTheme),
      ),
      home: const MedicineDetailsScreen(),
    );
  }
}

class MedicineDetailsScreen extends StatelessWidget {
  const MedicineDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text("تفاصيل الدواء"),
          actions: [
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: () {},
            ),
          ],
          leading: IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () {},
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _infoCard(title: "بانادول", subtitle: "أقراص"),
              const SizedBox(height: 16),

              _iconCard(
                icon: Icons.medication,
                title: "الجرعة",
                value: "قرص واحد 500 ملغ",
              ),
              const SizedBox(height: 16),

              _timesCard(),
              const SizedBox(height: 16),

              _iconCard(
                icon: Icons.calendar_month,
                title: "المدة",
                value: "لمدة 7 أيام",
              ),
              const SizedBox(height: 16),

              _warningCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoCard({required String title, required String subtitle}) {
    return _baseCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF2A2D36),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              subtitle,
              style: const TextStyle(color: Color(0xFFD6B56E)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _iconCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return _baseCard(
      child: Row(
        children: [
          _iconCircle(icon),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(color: Colors.grey)),
              const SizedBox(height: 4),
              Text(value, style: const TextStyle(fontSize: 16)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _timesCard() {
    return _baseCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _iconCircle(Icons.access_time),
              const SizedBox(width: 12),
              const Text("عدد المرات", style: TextStyle(color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 8),
          const Text("3 مرات يوميًا"),
          const SizedBox(height: 12),
          const Text(
            "أوقات التناول:",
            style: TextStyle(color: Color(0xFFD6B56E)),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: const [
              _TimeChip("08:00"),
              _TimeChip("14:00"),
              _TimeChip("20:00"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _warningCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2A1B12),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.orange),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Row(
            children: [
              Icon(Icons.warning_amber_rounded, color: Colors.orange),
              SizedBox(width: 8),
              Text(
                "تحذيرات مهمة",
                style: TextStyle(color: Colors.orange, fontSize: 16),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text("• لا تتجاوز 8 أقراص في اليوم"),
          SizedBox(height: 6),
          Text("• تناوله بعد الطعام"),
        ],
      ),
    );
  }

  Widget _baseCard({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1D24),
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );
  }

  Widget _iconCircle(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2D36),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: const Color(0xFFD6B56E)),
    );
  }
}

class _TimeChip extends StatelessWidget {
  final String time;
  const _TimeChip(this.time);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF111318),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(time),
    );
  }
}
