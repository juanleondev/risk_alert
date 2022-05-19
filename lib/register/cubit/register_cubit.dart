import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(const RegisterState());

  void onCheckTermsAndConditions() {
    emit(
      state.copyWith(acceptTermsAndConditions: !state.acceptTermsAndConditions),
    );
  }
}
