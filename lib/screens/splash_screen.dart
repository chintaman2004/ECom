// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'login_screen.dart';
import 'signup_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void exitApp() {
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else if (Platform.isIOS) {
      exit(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 🔹 Background Image
          Image.network(
            'https://images.pexels.com/photos/33202766/pexels-photo-33202766.jpeg',
            fit: BoxFit.cover,
          ),

          // 🔹 Dark overlay
          Container(color: Colors.black.withOpacity(0.6)),

          // 🔹 Main Content
          SafeArea(
            child: Column(
              children: [
                const Spacer(flex: 2),

                // 🔹 App Title Centered
                const Text(
                  'Fashion',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2,
                    shadows: [
                      Shadow(
                        color: Colors.black87,
                        offset: Offset(2, 2),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'My Life, My Choice',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontStyle: FontStyle.italic,
                    color: Colors.white70,
                    letterSpacing: 1.2,
                  ),
                ),

                const Spacer(flex: 3),

                // 🔹 Sign In Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        textStyle: const TextStyle(fontSize: 18),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => LoginScreen()),
                        );
                      },
                      child: const Text('Sign In'),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // 🔹 Sign Up Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: Colors.white),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        textStyle: const TextStyle(fontSize: 18),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => SignupScreen()),
                        );
                      },
                      child: const Text('Sign Up'),
                    ),
                  ),
                ),

                const Spacer(flex: 2),
              ],
            ),
          ),

          // 🔻 Exit Button Bottom Right
          Positioned(
            bottom: 20,
            right: 20,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
              ),
              onPressed: exitApp,
              icon: const Icon(Icons.exit_to_app, color: Colors.white),
              label: const Text('Exit', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
