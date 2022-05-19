import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:risk_alert/repositories/contact_repository.dart';

part 'map_alert_state.dart';

class MapAlertCubit extends Cubit<MapAlertState> {
  MapAlertCubit({required ContactRepository contactRepository})
      : _contactRepository = contactRepository,
        super(const MapAlertState()) {
    _selectedContactsIdSubscription =
        _contactRepository.selectedContactsId.listen(updateSelectedClients);
  }
  final ContactRepository _contactRepository;
  late StreamSubscription<List<String>> _selectedContactsIdSubscription;

  @override
  Future<void> close() {
    _selectedContactsIdSubscription.cancel();
    // TODO(juan): Check this
    // _contactRepository.dispose();
    return super.close();
  }

  void updateSelectedClients(List<String> selectedContactsId) {
    emit(state.copyWith(selectedContactsId: selectedContactsId));
  }
}
