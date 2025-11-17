import 'package:custom_otp/presentation/bloc/otp_cubit/otp_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpField extends StatefulWidget {
  const OtpField({super.key, required this.onCompleted});

  final VoidCallback onCompleted;

  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  final int length = 5;
  late List<TextEditingController> controllers;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(length, (e) {
      return TextEditingController();
    });
  }

  @override
  void dispose() {
    for (var c in controllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(length, (index) {
        return fieldInstance(index, context);
      }),
    );
  }

  Widget fieldInstance(int index, BuildContext context) {
    return Container(
      height: 50,
      width: 40,
      margin: EdgeInsets.symmetric(horizontal: 5),

      decoration: BoxDecoration(
        color: Color(0xFF1E1F21),
        border: Border.all(color: Color(0xFF2E2F31)),
        borderRadius: BorderRadius.circular(10),
      ),

      child: TextField(
        controller: controllers[index],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(counterText: "", border: InputBorder.none),
        onChanged: (value) {
          String otp = controllers.map((c) => c.text).join();
          print(otp.trim().length);
          if(otp.trim().length <= 5){
            widget.onCompleted;
          }
          context.read<OtpCubit>().updateOtp(otp);
        },
      ),
    );
  }
}
