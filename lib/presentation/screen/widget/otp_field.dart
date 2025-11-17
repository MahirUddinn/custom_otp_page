import 'package:flutter/material.dart';

class OtpField extends StatelessWidget {
  const OtpField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50,
          width: 40,
          decoration: BoxDecoration(
            color: Color(0xFF1E1F21),
            border: BoxBorder.all(color: Color(0xFF2E2F31))
          ),
        ),
      ],
    );
  }
}
