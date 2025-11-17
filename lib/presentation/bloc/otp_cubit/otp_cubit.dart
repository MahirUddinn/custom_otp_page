import 'package:flutter_bloc/flutter_bloc.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpState(otpCode: ""));

  void updateOtp(String otp) {
    emit(state.copyWith(otpCode: otp));
  }
}
