part of 'otp_cubit.dart';

class OtpState {
  final String otpCode;

  OtpState({required this.otpCode});

  OtpState copyWith({String? otpCode}) {
    return OtpState(otpCode: otpCode ?? this.otpCode);
  }
}
