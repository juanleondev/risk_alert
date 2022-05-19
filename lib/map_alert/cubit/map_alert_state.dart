part of 'map_alert_cubit.dart';

class MapAlertState extends Equatable {
  const MapAlertState({this.selectedContactsId = const []});
  final List<String> selectedContactsId;
  @override
  List<Object> get props => [selectedContactsId];

  MapAlertState copyWith({List<String>? selectedContactsId}) {
    return MapAlertState(
      selectedContactsId: selectedContactsId ?? this.selectedContactsId,
    );
  }
}
