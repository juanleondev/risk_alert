import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:risk_alert/add_contacts/cubit/add_contacts_cubit.dart';
import 'package:risk_alert/add_contacts/view/add_contact_bottom_sheet.dart';
import 'package:risk_alert/add_contacts/widgets/contact_tile.dart';
import 'package:risk_alert/map_alert/view/map_alert_page.dart';
import 'package:risk_alert/repositories/contact_repository.dart';
import 'package:risk_alert/theme/colors.dart';

class AddContactsPage extends StatelessWidget {
  const AddContactsPage({Key? key, this.isFirstShow = false}) : super(key: key);
  final bool isFirstShow;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddContactsCubit(
        contactRepository: context.read<ContactRepository>(),
      ),
      child: _AddContactsView(
        isFirstShow: isFirstShow,
      ),
    );
  }
}

class _AddContactsView extends StatelessWidget {
  const _AddContactsView({Key? key, required this.isFirstShow})
      : super(key: key);
  final bool isFirstShow;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        children: [
          Text(
            isFirstShow
                ? 'Añade tus contactos de confianza'
                : 'Contactos de confianza',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
          ),
          const SizedBox(
            height: 30,
          ),
          BlocBuilder<AddContactsCubit, AddContactsState>(
            builder: (context, state) {
              return ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.contacts.length,
                itemBuilder: (_, index) {
                  final _contact = state.contacts[index];
                  return ContactTile(
                    onTap: () {
                      context
                          .read<AddContactsCubit>()
                          .selectContact(_contact.id);
                    },
                    onDelete: () {
                      context
                          .read<AddContactsCubit>()
                          .deleteContact(_contact.id);
                    },
                    isSelected: state.selectedContacts.contains(_contact.id),
                    name: _contact.name,
                    phone: _contact.phone,
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(
                  height: 20,
                ),
              );
            },
          ),
          ListTile(
            onTap: () {
              showModalBottomSheet<dynamic>(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                isScrollControlled: true,
                builder: (_) => AddContactBottomSheet(
                  onAddContact: (phone, name) {
                    context.read<AddContactsCubit>().addContact(name, phone);
                  },
                ),
              );
            },
            leading: const Icon(
              Icons.add,
              color: primaryColor,
            ),
            title: const Text(
              'Añadir contacto',
              style:
                  TextStyle(fontWeight: FontWeight.w700, color: primaryColor),
            ),
          )
        ],
      ),
      bottomNavigationBar: Visibility(
        visible: isFirstShow,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 57.5, vertical: 50),
          child: SizedBox(
            width: 260,
            height: 42,
            child: ElevatedButton(
              onPressed: () => Navigator.pushAndRemoveUntil<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (_) => const MapAlertPage(),
                ),
                (Route<dynamic> route) => false,
              ),
              child: const Text('Siguiente'),
            ),
          ),
        ),
      ),
    );
  }
}
