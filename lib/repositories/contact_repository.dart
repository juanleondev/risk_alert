import 'dart:async';

import 'package:risk_alert/repositories/models/contact_model.dart';

class ContactRepository {
  final List<ContactModel> _contacts = [];
  final List<String> _selectedContactsId = [];
  final _controller = StreamController<List<ContactModel>>.broadcast();
  final _selectedContactsController =
      StreamController<List<String>>.broadcast();
  Stream<List<ContactModel>> get contacts async* {
    yield [..._contacts];
    yield* _controller.stream;
  }

  Stream<List<String>> get selectedContactsId async* {
    yield [..._selectedContactsId];
    yield* _selectedContactsController.stream;
  }

  void addContact(String name, String phone) {
    _contacts.add(ContactModel(id: name + phone, name: name, phone: phone));

    _controller.add([..._contacts]);
  }

  void deleteContact(String id) {
    _contacts.removeWhere((element) => element.id == id);

    _controller.add([..._contacts]);
  }

  void addSelectedContact(String id) {
    _selectedContactsId.add(id);
    _selectedContactsController.add([..._selectedContactsId]);
  }

  void removeSelectedContact(String id) {
    _selectedContactsId.removeWhere((element) => element == id);
    _selectedContactsController.add([..._selectedContactsId]);
  }

  void dispose() {
    _controller.close();
    _selectedContactsController.close();
  }
}
