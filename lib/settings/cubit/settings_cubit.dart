import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(const SettingsState());

  void onTapSwitch1() {
    emit(state.copyWith(shareLocation: !state.shareLocation));
  }

  void onTapSwitch2() {
    emit(state.copyWith(shareWithButton: !state.shareWithButton));
  }
}
