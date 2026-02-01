import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddMedicineScreen extends StatefulWidget {
  const AddMedicineScreen({super.key});

  @override
  State<AddMedicineScreen> createState() => _AddMedicineScreenState();
}

class _AddMedicineScreenState extends State<AddMedicineScreen> {
  String selectedType = 'أقراص';

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFF0F1117),

        // ===== AppBar =====
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xFF0F1117),
          elevation: 0,
          centerTitle: true,
          title: Text(
            'إضافة دواء جديد',
            style: GoogleFonts.cairo(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: CircleAvatar(
                radius: 22,
                backgroundColor: const Color(0xFF2A2D36), // دائرة أوضح
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 18,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
          ],
        ),

        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end, // ✅ كله يمين
            children: [
              _label('اسم الدواء *', icon: Icons.link),
              _input('مثال: بانادول'),

              const SizedBox(height: 16),
              _label('نوع الدواء'),

              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _typeButton('أقراص'),
                  const SizedBox(width: 12),
                  _typeButton('شراب'),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _typeButton('حقن'),
                  const SizedBox(width: 12),
                  _typeButton('أخرى'),
                ],
              ),

              const SizedBox(height: 20),
              _label('الجرعة *'),
              _input('مثال: قرص واحد 500 ملغ'),

              const SizedBox(height: 16),
              _label('عدد المرات *'),
              _input('مثال: 3 مرات يوميًا'),

              const SizedBox(height: 16),
              _label('أوقات التناول', icon: Icons.access_time),
              _input(''),

              const SizedBox(height: 12),
              _dashedButton('+ إضافة وقت آخر'),

              const SizedBox(height: 20),
              _label('المدة', icon: Icons.calendar_month),
              _input('مثال: لمدة 7 أيام'),

              const SizedBox(height: 16),
              _label('ملاحظات إضافية', icon: Icons.description),
              _bigInput('أي ملاحظات مهمة...'),

              const SizedBox(height: 24),
              _submitButton(),
            ],
          ),
        ),
      ),
    );
  }

  // ===== Widgets =====

  Widget _label(String text, {IconData? icon}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          text,
          style: GoogleFonts.cairo(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.right,
        ),
        if (icon != null) const SizedBox(width: 6),
        if (icon != null)
          Icon(icon, color: const Color(0xFFE0C36E), size: 18),
      ],
    );
  }

  Widget _input(String hint) {
    return Container(
      alignment: Alignment.centerRight, // ✅ سطر الحسم
      margin: const EdgeInsets.only(top: 8),
      child: TextField(
        textAlign: TextAlign.right,
        textDirection: TextDirection.rtl,
        style: GoogleFonts.cairo(color: Colors.white),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.cairo(color: Colors.grey),
          filled: true,
          fillColor: const Color(0xFF1A1D24),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _bigInput(String hint) {
    return Container(
      alignment: Alignment.centerRight,
      margin: const EdgeInsets.only(top: 8),
      child: TextField(
        maxLines: 4,
        textAlign: TextAlign.right,
        textDirection: TextDirection.rtl,
        style: GoogleFonts.cairo(color: Colors.white),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.cairo(color: Colors.grey),
          filled: true,
          fillColor: const Color(0xFF1A1D24),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _typeButton(String text) {
    final isSelected = selectedType == text;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedType = text),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color:
            isSelected ? const Color(0xFFE0C36E) : const Color(0xFF1A1D24),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.cairo(
                color: isSelected ? Colors.black : Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _dashedButton(String text) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF2A2D36)),
      ),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.cairo(
            color: const Color(0xFFE0C36E),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _submitButton() {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFE0C36E),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        onPressed: () {},
        child: Text(
          'إضافة الدواء',
          style: GoogleFonts.cairo(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
