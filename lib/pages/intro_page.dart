import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_sushi_app/themes/app_colors.dart' show AppColors;
import '../components/button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Gradient background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primary, AppColors.couponBg],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                // App Logo in a Card
                Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: CircleAvatar(
                      radius: 55,
                      backgroundImage: AssetImage(
                        'assets/images/main_momo.png',
                      ),
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                // Main title
                Text(
                  "MOMO hUb",
                  style: GoogleFonts.dmSerifDisplay(
                    fontSize: 40,
                    color: Colors.white.withValues(alpha: 0.2),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    shadows: [
                      Shadow(
                        blurRadius: 6,
                        color: Colors.black.withValues(alpha: 0.2),
                        offset: Offset(1, 2),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                // Subtitle
                Text(
                  "The Taste of Nepalese Food",
                  style: GoogleFonts.dmSerifDisplay(
                    fontSize: 22,
                    color: Colors.white.withValues(alpha: 0.2),
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.2,
                    shadows: [
                      Shadow(
                        blurRadius: 4,
                        color: Colors.black.withValues(alpha: 0.2),
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // Tagline with icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, color: Colors.amber.shade400, size: 28),
                    const SizedBox(width: 8),
                    Text(
                      "Authentic, Fresh & Delicious",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.white.withValues(alpha: 0.93),
                        fontWeight: FontWeight.w600,
                        shadows: [
                          Shadow(
                            blurRadius: 3,
                            color: Colors.black.withValues(alpha: 0.2),
                            offset: Offset(1, 1),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                // Illustration or secondary image (optional)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/momo_one.png',
                      height: 170,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                // Description
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 36),
                  child: Text(
                    "Order the most popular Nepali food from anywhere, anytime. Experience the real taste of home with every bite.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.white.withValues(alpha: 0.95),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      height: 1.6,
                      shadows: [
                        Shadow(
                          blurRadius: 2,
                          color: Colors.black.withValues(alpha: 0.18),
                          offset: Offset(1, 1),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                // Get Started button
                Padding(
                  padding: const EdgeInsets.only(bottom: 34.0),
                  child: MyButton(
                    text: "Get Started",
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
