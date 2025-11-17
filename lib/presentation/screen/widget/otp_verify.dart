import 'package:flutter/material.dart';

class OtpVerify extends StatelessWidget {
  const OtpVerify({super.key, required this.onVerify});

  final VoidCallback onVerify;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onVerify,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF0793EB),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            "Verify",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
