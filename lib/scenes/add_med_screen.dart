import 'package:flutter/material.dart';

class AddMedScreen extends StatelessWidget {
  const AddMedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0F1115),
        primaryColor: const Color(0xFFE0C36E),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFF1C1F26),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          hintStyle: const TextStyle(color: Colors.grey),
        ),
      ),
      home: const AddMedicineScreen(),
    );
  }
}

class AddMedicineScreen extends StatefulWidget {
  const AddMedicineScreen({super.key});

  @override
  State<AddMedicineScreen> createState() => _AddMedicineScreenState();
}

class _AddMedicineScreenState extends State<AddMedicineScreen> {
  String selectedType = "أقراص";

  Widget buildTypeButton(String title) {
    final isSelected = selectedType == title;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedType = title;
          });
        },
        child: Container(
          height: 48,
          decoration: BoxDecoration(
            color: isSelected
                ? const Color(0xFFE0C36E)
                : const Color(0xFF1C1F26),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.black : Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildField(String label, String hint, {IconData? icon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (icon != null)
              Icon(icon, color: const Color(0xFFE0C36E), size: 18),
            if (icon != null) const SizedBox(width: 6),
            Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 8),
        TextField(decoration: InputDecoration(hintText: hint)),
        const SizedBox(height: 16),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("إضافة دواء جديد"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildField("اسم الدواء *", "مثال: بانادول", icon: Icons.link),
            const Text(
              "نوع الدواء *",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                buildTypeButton("شراب"),
                const SizedBox(width: 8),
                buildTypeButton("أقراص"),
                const SizedBox(width: 8),
                buildTypeButton("حقن"),
                const SizedBox(width: 8),
                buildTypeButton("أخرى"),
              ],
            ),
            const SizedBox(height: 16),
            buildField("الجرعة *", "مثال: قرص واحد 500 ملغ"),
            buildField("عدد المرات *", "مثال: 3 مرات يوميًا"),
            buildField("أوقات التناول *", "", icon: Icons.access_time),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () {},
              child: const Text(
                "+ إضافة وقت آخر",
                style: TextStyle(color: Color(0xFFE0C36E)),
              ),
            ),
            const SizedBox(height: 8),
            buildField(
              "المدة *",
              "مثال: لمدة 7 أيام",
              icon: Icons.calendar_month,
            ),
            buildField(
              "ملاحظات إضافية",
              "أي ملاحظات مهمة...",
              icon: Icons.description,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE0C36E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "إضافة الدواء",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
