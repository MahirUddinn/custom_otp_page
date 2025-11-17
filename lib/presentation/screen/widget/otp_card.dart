import 'package:custom_otp/presentation/bloc/otp_cubit/otp_cubit.dart';
import 'package:custom_otp/presentation/screen/widget/otp_field.dart';
import 'package:custom_otp/presentation/screen/widget/otp_resend.dart';
import 'package:custom_otp/presentation/screen/widget/otp_verify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class OtpCard extends StatelessWidget {
  const OtpCard({super.key, required this.title, required this.onOtpCompleted, required this.resendTimerSecond, required this.onOtpResend, required this.onVerify, });

  final Widget title;
  final void Function(String) onOtpCompleted;
  final int resendTimerSecond;
  final void Function() onOtpResend;
  final void Function() onVerify;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Center(
            child: title
          ),
          SizedBox(height: 20),
          OtpField(onCompleted: onOtpCompleted),
          SizedBox(height: 20),
          resendTimerSecond != 0?
          OtpResend(initialSeconds: resendTimerSecond, onResend: onOtpResend): SizedBox(),
          SizedBox(height: 20),
          OtpVerify(
            onVerify: onVerify,
          ),
        ],
      ),
    );
  }
}


