import 'dart:async';
import 'package:flutter/material.dart';

class OtpResend extends StatefulWidget {
  final int initialSeconds;
  final VoidCallback onResend;

  const OtpResend({
    super.key,
    required this.initialSeconds,
    required this.onResend,
  });

  @override
  State<OtpResend> createState() => _OtpResendState();
}

class _OtpResendState extends State<OtpResend> {
  late Timer _timer;
  late int _secondsRemaining;

  @override
  void initState() {
    super.initState();
    _secondsRemaining = widget.initialSeconds;
    startTimer();
  }

  void startTimer() {
    setState(() {
      _secondsRemaining = widget.initialSeconds;
    });

    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      if (_secondsRemaining == 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          _secondsRemaining--;
        });
      }
    });
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;

    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = remainingSeconds.toString().padLeft(2, '0');

    return "$minutesStr:$secondsStr";
  }

  void resendPressed() {
    startTimer();
    widget.onResend();
  }

  @override
  void dispose() {
    if (_timer.isActive) _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Didn't get code? "),
        _secondsRemaining == 0
            ? GestureDetector(
                onTap: resendPressed,
                child: Text(
                  "Resend Now",
                  style: const TextStyle(color: Colors.blue),
                ),
              )
            : Text(
                _formatTime(_secondsRemaining),
                style: const TextStyle(color: Colors.blue),
              ),
      ],
    );
  }
}
