import 'package:bloc/bloc.dart';

class OnboardingCubit extends Cubit<int> {
  OnboardingCubit({required this.totalPages}) : super(0);
  final int totalPages;
  void onPageChanged(int page) {
    emit(page);
  }

  void onNextButtonTap() {
    emit(state + 1);
  }
}
