import 'package:custom_otp/presentation/screen/widget/otp_card.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: OtpCard(
          title: Text("New otp sent"),
          onOtpCompleted: (str) {
            print(str);
          },
          onOtpResend: () {},
          onVerify: () {},
          resendTimerSecond: 0,
        ),
      ),
    );
  }
}
