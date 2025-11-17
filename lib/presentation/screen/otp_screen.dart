import 'package:custom_otp/presentation/bloc/otp_cubit/otp_cubit.dart';
import 'package:custom_otp/presentation/screen/widget/otp_field.dart';
import 'package:custom_otp/presentation/screen/widget/otp_resend.dart';
import 'package:custom_otp/presentation/screen/widget/otp_verify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Text(
                "We have sent you an OTP to your register mobile number or email",
              ),
              SizedBox(height: 20),
              OtpField(
                onCompleted: () {
                  print("complete");
                },
              ),
              SizedBox(height: 20),
              OtpResend(initialSeconds: 20, onResend: () {}),
              SizedBox(height: 20),
              BlocBuilder<OtpCubit, OtpState>(
                builder: (context, state) {
                  return OtpVerify(
                    onVerify: () {
                      print(state.otpCode);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
