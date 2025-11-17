import 'package:flutter/material.dart';

class OtpField extends StatefulWidget {
  const OtpField({super.key, required this.onCompleted, required this.otpLength});

  final void Function(String otp) onCompleted;
  final int otpLength;

  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  late final int length = widget.otpLength;
  late List<TextEditingController> controllers;
  late List<FocusNode> nodes;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(length, (_) => TextEditingController());
    nodes = List.generate(length, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (var c in controllers) {
      c.dispose();
    }
    for (var f in nodes) {
      f.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(length, (index) {
        return fieldInstance(index);
      }),
    );
  }

  Widget fieldInstance(int index) {
    return Container(
      height: 50,
      width: 40,
      margin: const EdgeInsets.symmetric(horizontal: 5),

      decoration: BoxDecoration(
        color: const Color(0xFF1E1F21),
        border: Border.all(color: const Color(0xFF2E2F31)),
        borderRadius: BorderRadius.circular(10),
      ),

      child: TextField(
        controller: controllers[index],
        focusNode: nodes[index],
        textAlign: TextAlign.center,
        maxLength: 1,
        keyboardType: TextInputType.number,
        style: const TextStyle(color: Colors.white),
        decoration: const InputDecoration(
          counterText: "",
          border: InputBorder.none,
        ),
        textInputAction: TextInputAction.none,

        onChanged: (value) {
          if (value.isNotEmpty && index < length - 1) {
            nodes[index + 1].requestFocus();
          }

          if (value.isEmpty && index > 0) {
            nodes[index - 1].requestFocus();
          }

          String otp = controllers.map((c) => c.text).join();

          if (otp.length == length) {
            widget.onCompleted(otp);
          }
        },
      ),
    );
  }
}
