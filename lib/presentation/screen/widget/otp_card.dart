import 'package:custom_otp/presentation/screen/widget/otp_field.dart';
import 'package:custom_otp/presentation/screen/widget/otp_resend.dart';
import 'package:custom_otp/presentation/screen/widget/otp_verify.dart';
import 'package:flutter/material.dart';

class OtpCard extends StatelessWidget {
  const OtpCard({
    super.key,
    required this.title,
    required this.onOtpCompleted,
    this.resendTimerSecond = 0,
    this.onOtpResend = _defaultResend,
    required this.onVerify,
    required this.otpLength,
  });

  final Widget title;
  final void Function(String) onOtpCompleted;
  final int resendTimerSecond;
  final void Function() onOtpResend;
  final void Function() onVerify;
  final int otpLength;

  static void _defaultResend() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Center(child: title),
          SizedBox(height: 20),
          OtpField(onCompleted: onOtpCompleted, otpLength: otpLength),
          SizedBox(height: 20),

          resendTimerSecond != 0
              ? OtpResend(
                  initialSeconds: resendTimerSecond,
                  onResend: onOtpResend,
                )
              : Container(),

          resendTimerSecond != 0 ? SizedBox(height: 20) : Container(),

          OtpVerify(onVerify: onVerify),
        ],
      ),
    );
  }
}
