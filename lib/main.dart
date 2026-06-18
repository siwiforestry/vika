import 'package:flutter/material.dart';

void main() {
  runApp(const VikaApp());
}

class VikaApp extends StatelessWidget {
  const VikaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VIKA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Inter',
        scaffoldBackgroundColor: const Color(0xFF243D56),
      ),
      home: const WelcomeScreen(),
    );
  }
}

Widget buildMobileFrame({required Widget child}) {
  return Center(
    child: Container(
      constraints: const BoxConstraints(maxWidth: 450),
      decoration: const BoxDecoration(
        color: Color(0xFF243D56),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10, spreadRadius: 2)],
      ),
      child: child,
    ),
  );
}

Widget buildCustomBackButton(BuildContext context) {
  return GestureDetector(
    onTap: () => Navigator.pop(context),
    child: Image.asset(
      'assets/images/backbutton_vika.png', // Nama file yang sudah kamu daftarkan
      height: 40, // Sesuaikan ukurannya agar pas
      fit: BoxFit.contain,
      errorBuilder: (c, e, s) => const Icon(Icons.arrow_back, color: Colors.white, size: 36),
    ),
  );
}

// 1. WELCOME SCREEN
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildMobileFrame(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Image.asset('assets/images/vika_mascot.png', height: 180, errorBuilder: (c, e, s) => const Icon(Icons.emoji_emotions, size: 100)),
                const SizedBox(height: 24),
                const Text("Vika's Here For You", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFFFFA726))),
                const SizedBox(height: 32),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Right Vitamin.\nRight Time.\nPerfect Absorption.", style: TextStyle(fontSize: 22, height: 1.4, fontWeight: FontWeight.bold, color: Color(0xFFFFA726))),
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF5CD87A), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AddSupplementScreen())),
                    child: const Text('Get Started', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("I already have an account. ", style: TextStyle(color: Colors.white70, fontSize: 15)),
                    GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen())),
                      child: const Text("Log in", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 15)),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// 2. LOGIN SCREEN
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildMobileFrame(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    buildCustomBackButton(context),
                    const SizedBox(width: 20),
                    const Text('Log in', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white)),
                  ],
                ),
                const SizedBox(height: 48),
                const Text('Email', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 8),
                TextFormField(
                  initialValue: 'salsabilla@gmail.com',
                  decoration: InputDecoration(filled: true, fillColor: const Color(0xFFCFD8DC), border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none)),
                ),
                const SizedBox(height: 24),
                const Text('Passwords', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 8),
                TextFormField(
                  initialValue: '1234',
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFCFD8DC),
                    suffixIcon: IconButton(icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility, color: Colors.black), onPressed: () => setState(() => _obscurePassword = !_obscurePassword)),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(height: 16),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Remember Me', style: TextStyle(color: Colors.white70)), Text('Forgot Password?', style: TextStyle(color: Colors.white70))],
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF5CD87A), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AddSupplementScreen())),
                    child: const Text('Log in', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                  ),
                ),
                const SizedBox(height: 32),
                const Center(child: Text('Or', style: TextStyle(color: Colors.white, fontSize: 16))),
                const SizedBox(height: 32),
                _buildSocialButton('Continue With Google', Icons.g_mobiledata),
                const SizedBox(height: 16),
                _buildSocialButton('Continue With Apple', Icons.apple),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(String label, IconData icon) {
    return Container(
      width: double.infinity,
      height: 56,
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(color: const Color(0xFFCFD8DC), borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Icon(icon, size: 30, color: Colors.black), const SizedBox(width: 12), Text(label, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black))],
      ),
    );
  }
}

// 3. ADD SUPPLEMENT SCREEN
class AddSupplementScreen extends StatelessWidget {
  const AddSupplementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> items = ['Iron', 'Vit. D3', 'Pumpkin Seed Oil', 'Zinc', 'Moringa'];
    return Scaffold(
      body: buildMobileFrame(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildCustomBackButton(context),
                const SizedBox(height: 16),
                const Text('Add Supplement', style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 8),
                const Text('Vika will check if your daily vitamins clash with each other.', style: TextStyle(color: Colors.white60, fontSize: 14)),
                const SizedBox(height: 24),
                const Text('Select Supplement', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                ...items.map((item) => Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                          decoration: BoxDecoration(color: const Color(0xFF455A64), borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.white38)),
                          child: DropdownButton<String>(
                            value: item,
                            dropdownColor: const Color(0xFF455A64),
                            isExpanded: true,
                            underline: const SizedBox(),
                            style: const TextStyle(color: Colors.white),
                            items: [DropdownMenuItem(value: item, child: Text(item))],
                            onChanged: (_) {},
                          ),
                        ),
                      ),
                      if (item != 'Iron') ...[const SizedBox(width: 12), const Icon(Icons.delete, color: Colors.redAccent)]
                    ],
                  ),
                )),
                const SizedBox(height: 12),
                const Text('+ Add Another Supplement', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w600)),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF5CD87A), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SmartAnalyzerScreen())),
                    child: const Text('Analyze Now', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                  ),
                ),
                const SizedBox(height: 24),
                Center(child: Image.asset('assets/images/vitamins.png', height: 200, errorBuilder: (c, e, s) => const SizedBox())),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// 4. HOME SCREEN
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildMobileFrame(
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Hello, Beautiful Sassha!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                              Text('Tue, April 25th 2026', style: TextStyle(color: Colors.white60)),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(color: const Color(0xFF37474F), borderRadius: BorderRadius.circular(12)),
                            child: const Text('🔥 5 Days', style: TextStyle(color: Colors.white, fontSize: 12)),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(color: const Color(0xFF5CD87A), borderRadius: BorderRadius.circular(16)),
                        child: const Text('You have 5 vitamins scheduled today. All combos are optimized with no clashes!', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600), textAlign: TextAlign.center),
                      ),
                      const SizedBox(height: 20),
                      _buildTimelineSection('Morning Timeline', 'Iron', 'Take it before having meal', 'Best taken 2 hours after breakfast or 2 hours before lunch.', true),
                      _buildTimelineSection('Lunch Timeline', 'Pumpkin Seed Oil, Vit D3', 'Take it after having meal', 'These are fat-soluble vitamins. Take them with healthy fats like healthy oils, eggs, or avocado to maximize absorption up to 50%!', true),
                      _buildTimelineSection('', 'Zinc', 'Take it before having meal', "Best taken 2 hours after lunch or 2 hours before dinner.\n\nVika's Tip: Skip your coffee or tea for a moment! Caffeine can block Zinc from absorbing properly.", false),
                      _buildTimelineSection('Evening Timeline', 'Moringa Supplement', 'Take it after having meal', "Take your Moringa after dinner. Its rich antioxidants and amino acids work best overnight to support your body's natural recovery while you sleep.", false),
                    ],
                  ),
                ),
              ),
              buildBottomNavbar(context, activeIndex: 0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimelineSection(String title, String name, String tag, String desc, bool isChecked) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty) ...[Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)), const SizedBox(height: 8)],
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: const Color(0xFF37474F), borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                  Icon(isChecked ? Icons.check_circle : Icons.radio_button_unchecked, color: isChecked ? const Color(0xFF5CD87A) : Colors.white30),
                ],
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(color: const Color(0xFFFFA726), borderRadius: BorderRadius.circular(8)),
                child: Text(tag, style: const TextStyle(color: Colors.black, fontSize: 11, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 8),
              Text(desc, style: TextStyle(color: name == 'Zinc' ? const Color(0xFFFFA726) : Colors.white70, fontSize: 13, height: 1.3)),
            ],
          ),
        )
      ],
    );
  }
}

// 5. INSIGHTS SCREEN
class InsightsScreen extends StatelessWidget {
  const InsightsScreen({super.key});

  Widget _buildProgressRow(String title, double progress, String percent, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(child: Text(title, style: const TextStyle(color: Colors.white))),
          Expanded(
            flex: 2,
            child: LinearProgressIndicator(value: progress, color: color, backgroundColor: Colors.white24),
          ),
          const SizedBox(width: 10),
          Text(percent, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildMobileFrame(
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Monthly Insights', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
                      const SizedBox(height: 24),
                      Center(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            const SizedBox(
                              height: 180,
                              width: 180,
                              child: CircularProgressIndicator(value: 0.8, strokeWidth: 16, backgroundColor: Colors.white10, valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF5CD87A))),
                            ),
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('80%', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white)),
                                Text('Adherence Score', style: TextStyle(color: Colors.white54, fontSize: 12)),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(color: const Color(0xFF37474F), borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            _buildProgressRow('Iron', 0.95, '95%', Colors.green),
                            _buildProgressRow('Pumpkin Seed Oil', 0.90, '90%', Colors.green),
                            _buildProgressRow('Vit. D3', 0.90, '90%', Colors.green),
                            _buildProgressRow('Zinc', 0.75, '75%', Colors.orange),
                            _buildProgressRow('Moringa', 0.50, '50%', Colors.redAccent),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('assets/images/vikasmile.png', height: 60, errorBuilder: (c, e, s) => const Icon(Icons.face, color: Colors.orange)),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(14),
                              decoration: BoxDecoration(color: const Color(0xFF37474F), borderRadius: BorderRadius.circular(16)),
                              child: const Text(
                                "Great job! Your Iron absorption is at its peak this month. However, you often miss your Zinc intake on weekends, and your Moringa compliance is quite low at 50%. Since Moringa is scheduled for your evening routine, you might be forgetting it due to fatigue. Let's set a wind-down reminder to improve it next week!",
                                style: TextStyle(color: Color(0xFF5CD87A), fontSize: 12, height: 1.3),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              buildBottomNavbar(context, activeIndex: 2),
            ],
          ),
        ),
      ),
    );
  }
}

class SmartAnalyzerScreen extends StatelessWidget {
  const SmartAnalyzerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildMobileFrame(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text("Vika Smart Analyzer", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 24),
                Image.asset('assets/images/analyzevika.png', height: 160, errorBuilder: (c, e, s) => const Icon(Icons.psychology, size: 100, color: Colors.greenAccent)),
                const SizedBox(height: 16),
                const Text("Analyzing your supplement combination...", style: TextStyle(color: Colors.white70)),
                const SizedBox(height: 32),
                const Text("Clash Detection Widget", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(color: const Color(0xFF455A64), borderRadius: BorderRadius.circular(20)),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("⚠️ 2 Potential Clashes Detected!", style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      Text("1. Your supplement list contains Zinc and Iron. If these two are scheduled at the same time, it will reduce Iron absorption by up to 50%.", style: TextStyle(color: Colors.white70, fontSize: 13)),
                      SizedBox(height: 8),
                      Text("2. Moringa contains high levels of phytates, which can bind to Zinc in your gut and severely block its absorption.", style: TextStyle(color: Colors.white70, fontSize: 13)),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(color: const Color(0xFF37474F), borderRadius: BorderRadius.circular(20)),
                  child: const Column(
                    children: [
                      Text("💡 Vika's Smart Solution", style: TextStyle(color: Color(0xFF5CD87A), fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      Text("Vika has automatically optimized your schedule! Iron is isolated to your morning, Vit. D3 & Pumpkin Seed Oil at lunch, while Zinc & Moringa are staggered to guarantee 100% absorption.", style: TextStyle(color: Colors.white70, fontSize: 13), textAlign: TextAlign.center),
                    ],
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF5CD87A), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
                    onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen())),
                    child: const Text('Apply to My Schedule', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildProgressRow(String title, double value, String label, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(Icons.circle, size: 14, color: color),
          const SizedBox(width: 12),
          SizedBox(width: 130, child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 14))),
          Expanded(child: LinearProgressIndicator(value: value, color: color, backgroundColor: Colors.white10)),
          const SizedBox(width: 12),
          Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

// ==========================================
// GLOBAL NAVBAR (Anti Gagal Potong)
// ==========================================
Widget buildBottomNavbar(BuildContext context, {required int activeIndex}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10),
    decoration: const BoxDecoration(
      color: Color(0xFF37474F),
      borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () { if (activeIndex != 0) Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen())); },
          child: Image.asset('assets/images/homebutton.png', height: 54, errorBuilder: (c, e, s) => Icon(Icons.home, size: 36, color: activeIndex == 0 ? const Color(0xFF5CD87A) : Colors.white54)),
        ),
        GestureDetector(
          onTap: () { if (activeIndex != 1) Navigator.push(context, MaterialPageRoute(builder: (context) => const AddSupplementScreen())); },
          child: Image.asset('assets/images/analyzerbutton.png', height: 54, errorBuilder: (c, e, s) => Icon(Icons.add_circle, size: 36, color: activeIndex == 1 ? const Color(0xFF5CD87A) : Colors.white54)),
        ),
        GestureDetector(
          onTap: () { if (activeIndex != 2) Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const InsightsScreen())); },
          child: Image.asset('assets/images/insightbutton.png', height: 54, errorBuilder: (c, e, s) => Icon(Icons.bar_chart, size: 36, color: activeIndex == 2 ? const Color(0xFF5CD87A) : Colors.white54)),
        ),
      ],
    ),
  );
}