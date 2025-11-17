import 'package:custom_otp/presentation/screen/otp_screen.dart';
import 'package:flutter/material.dart';
class CustomOtp extends StatelessWidget {
  const CustomOtp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.dark,
      home: OtpScreen(otpInfo: Text("We have sent you an OTP to your register mobile number or email"),),
    );
  }
}
