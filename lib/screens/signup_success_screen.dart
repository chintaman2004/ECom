import 'package:flutter/material.dart';
import 'dashboard.dart';

class SignupSuccessScreen extends StatelessWidget {
  const SignupSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 80),
            const SizedBox(height: 16),
            const Text("Successful!", style: TextStyle(fontSize: 24)),
            const SizedBox(height: 8),
            const Text("You have successfully registered."),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const Dashboard()),
                );
              },
              child: const Text("Start Shopping"),
            ),
          ],
        ),
      ),
    );
  }
}
