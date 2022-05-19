part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  const SettingsState({
    this.shareLocation = false,
    this.shareWithButton = false,
  });
  final bool shareLocation;
  final bool shareWithButton;
  @override
  List<Object> get props => [shareLocation, shareWithButton];

  SettingsState copyWith({bool? shareLocation, bool? shareWithButton}) {
    return SettingsState(
      shareLocation: shareLocation ?? this.shareLocation,
      shareWithButton: shareWithButton ?? this.shareWithButton,
    );
  }
}
