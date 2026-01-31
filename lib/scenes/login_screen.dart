import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFF0F1117),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 24),

                // 🌐 Language icon
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.language, color: Colors.grey),
                  ),
                ),

                const SizedBox(height: 40),

                // 🟨 Logo + title
                _buildHeader(),

                const SizedBox(height: 40),

                // 🔐 Login card
                _buildLoginCard(),

                const SizedBox(height: 20),

                // 🔵 Nafath login
                _buildNafathButton(),

                const SizedBox(height: 24),

                // OR
                _buildDivider(),

                const SizedBox(height: 24),

                // 👤 Guest login
                _buildGuestButton(),

                const SizedBox(height: 12),

                const Text(
                  'للتصفح والاطلاع فقط بدون حفظ البيانات',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 🟨 Header
  Widget _buildHeader() {
    return Column(
      children: const [
        Text(
          'نبيه',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Color(0xFFE6C76A),
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Nabih',
          style: TextStyle(color: Color(0xFFE6C76A)),
        ),
        SizedBox(height: 12),
        Text(
          'مساعدك الدوائي الذكي',
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
      ],
    );
  }

  // 🔐 Login card
  Widget _buildLoginCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1D26),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'تسجيل الدخول',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          const Text(
            'استخدم بيانات حسابك في تطبيق نسك',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          const SizedBox(height: 20),

          // ID field
          _buildTextField(
            hint: 'رقم الهوية',
            icon: Icons.badge_outlined,
            keyboardType: TextInputType.number,
          ),

          const SizedBox(height: 16),

          // Password field
          _buildTextField(
            hint: 'الرمز السري',
            icon: Icons.lock_outline,
            isPassword: true,
          ),

          const SizedBox(height: 24),

          // Login button
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE6C76A),
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: const Text(
              'تسجيل الدخول',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(height: 12),

          TextButton(
            onPressed: () {},
            child: const Text(
              'تسجيل دخول سند',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  // 🔵 Nafath
  Widget _buildNafathButton() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF14233D),
        borderRadius: BorderRadius.circular(14),
      ),
      child: const Text(
        'نبيه مدمج مع تطبيق نسك باستخدام نفس بيانات تسجيل الدخول',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.lightBlueAccent, fontSize: 13),
      ),
    );
  }

  // OR divider
  Widget _buildDivider() {
    return Row(
      children: const [
        Expanded(child: Divider(color: Colors.grey)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text('أو', style: TextStyle(color: Colors.grey)),
        ),
        Expanded(child: Divider(color: Colors.grey)),
      ],
    );
  }

  // 👤 Guest
  Widget _buildGuestButton() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1D26),
        borderRadius: BorderRadius.circular(14),
      ),
      child: const Text(
        'الدخول كضيف',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 14),
      ),
    );
  }

  // 🧾 Input field
  Widget _buildTextField({
    required String hint,
    required IconData icon,
    bool isPassword = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      obscureText: isPassword,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        prefixIcon: Icon(icon, color: Colors.grey),
        suffixIcon: isPassword
            ? const Icon(Icons.visibility_off, color: Colors.grey)
            : null,
        filled: true,
        fillColor: const Color(0xFF12141A),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
