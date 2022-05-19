import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:risk_alert/repositories/contact_repository.dart';
import 'package:risk_alert/repositories/models/contact_model.dart';

part 'add_contacts_state.dart';

class AddContactsCubit extends Cubit<AddContactsState> {
  AddContactsCubit({required ContactRepository contactRepository})
      : _contactRepository = contactRepository,
        super(const AddContactsState()) {
    _contactsSubscription = _contactRepository.contacts.listen(updateContacts);
    _selectedContactsIdSubscription =
        _contactRepository.selectedContactsId.listen(updateSelectedContactsId);
  }

  final ContactRepository _contactRepository;
  late StreamSubscription<List<ContactModel>> _contactsSubscription;
  late StreamSubscription<List<String>> _selectedContactsIdSubscription;
  @override
  Future<void> close() {
    _contactsSubscription.cancel();
    _selectedContactsIdSubscription.cancel();

    return super.close();
  }

  void updateContacts(List<ContactModel> contacts) {
    emit(state.copyWith(contacts: List.from(contacts)));
  }

  void updateSelectedContactsId(List<String> selectedContactsId) {
    emit(state.copyWith(selectedContacts: selectedContactsId));
  }

  void addContact(String name, String phone) {
    _contactRepository.addContact(name, phone);
  }

  void deleteContact(String id) {
    _contactRepository.deleteContact(id);
  }

  void selectContact(String id) {
    final isSelected = state.selectedContacts.contains(id);
    if (isSelected) {
      _contactRepository.removeSelectedContact(id);
    } else {
      _contactRepository.addSelectedContact(id);
    }
  }
}
