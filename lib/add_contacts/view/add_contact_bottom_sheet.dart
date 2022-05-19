import 'package:flutter/material.dart';
import 'package:risk_alert/widgets/custom_text_field.dart';

class AddContactBottomSheet extends StatefulWidget {
  const AddContactBottomSheet({Key? key, required this.onAddContact})
      : super(key: key);
  final Function(String, String) onAddContact;

  @override
  State<AddContactBottomSheet> createState() => _AddContactBottomSheetState();
}

class _AddContactBottomSheetState extends State<AddContactBottomSheet> {
  final TextEditingController nameTEC = TextEditingController();
  final TextEditingController phoneTEC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: MediaQuery.of(context).viewInsets,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 30, 30, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Nuevo contacto'),
            const SizedBox(
              height: 14,
            ),
            CustomTextField(
              title: 'Nombre',
              hintText: 'Mamá',
              controller: nameTEC,
            ),
            const SizedBox(
              height: 36,
            ),
            CustomTextField(
              title: 'N° de celular',
              hintText: '999 999 999',
              controller: phoneTEC,
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 260,
              height: 42,
              child: ElevatedButton(
                onPressed: () {
                  widget.onAddContact(nameTEC.text, phoneTEC.text);
                  Navigator.pop(context);
                },
                child: const Text('Añadir'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
