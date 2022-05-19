part of 'register_cubit.dart';

class RegisterState extends Equatable {
  const RegisterState({this.acceptTermsAndConditions = false});
  final bool acceptTermsAndConditions;
  @override
  List<Object> get props => [acceptTermsAndConditions];

  RegisterState copyWith({bool? acceptTermsAndConditions}) {
    return RegisterState(
      acceptTermsAndConditions:
          acceptTermsAndConditions ?? this.acceptTermsAndConditions,
    );
  }
}
