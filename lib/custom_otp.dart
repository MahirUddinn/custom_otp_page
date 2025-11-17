import 'package:custom_otp/presentation/bloc/otp_cubit/otp_cubit.dart';
import 'package:custom_otp/presentation/screen/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomOtp extends StatelessWidget {
  const CustomOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: BlocProvider(
        create: (context) => OtpCubit(),
        child: OtpScreen(),
      ),
    );
  }
}
