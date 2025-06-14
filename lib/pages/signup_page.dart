import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_sushi_app/themes/app_colors.dart' show AppColors;
import '../components/button.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // App logo or profile
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/profile.jpg'),
                backgroundColor: Colors.white,
              ),
              const SizedBox(height: 24),
              Text(
                "Create Account",
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 32,
                  color: const Color.fromARGB(255, 221, 76, 32),
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Sign up to get started brutha",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.black.withValues(alpha: 0.65),
                ),
              ),
              const SizedBox(height: 32),
              // Name field
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person, color: AppColors.primary),
                  hintText: "Full Name",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 18),
              // Email field
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email, color: AppColors.primary),
                  hintText: "Email",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 18),
              // Password field
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock, color: AppColors.primary),
                  hintText: "Password",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 28),
              // Sign Up button
              MyButton(
                text: "Sign Up",
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/menupage');
                },
              ),
              const SizedBox(height: 18),
              // Already have account option
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: GoogleFonts.poppins(
                      color: Colors.black87,
                      fontSize: 15,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: Text(
                      "Sign In",
                      style: GoogleFonts.poppins(
                        color: const Color.fromARGB(255, 246, 110, 68),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
