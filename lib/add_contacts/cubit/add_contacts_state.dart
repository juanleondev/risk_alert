part of 'add_contacts_cubit.dart';

class AddContactsState extends Equatable {
  const AddContactsState({
    this.contacts = const [],
    this.selectedContacts = const [],
  });
  final List<ContactModel> contacts;
  final List<String> selectedContacts;
  @override
  List<Object> get props => [contacts, selectedContacts];

  AddContactsState copyWith({
    List<ContactModel>? contacts,
    List<String>? selectedContacts,
  }) {
    return AddContactsState(
      contacts: contacts ?? this.contacts,
      selectedContacts: selectedContacts ?? this.selectedContacts,
    );
  }
}
