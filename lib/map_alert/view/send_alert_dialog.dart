import 'package:flutter/material.dart';
import 'package:risk_alert/theme/colors.dart';

class SendAlertDialog extends StatelessWidget {
  const SendAlertDialog({Key? key, required this.contactsCounter})
      : super(key: key);
  final int contactsCounter;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Enviando tu ubicación a:'),
            const SizedBox(
              height: 11,
            ),
            Text(
              '$contactsCounter  contactos',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: primaryColor,
              ),
            ),
            const SizedBox(
              height: 33,
            ),
            Text(
              contactsCounter.toString(),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: primaryColor,
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            SizedBox(
              width: 260,
              height: 42,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Enviar ahora'),
              ),
            ),
            const SizedBox(
              height: 9,
            ),
            SizedBox(
              width: 260,
              height: 42,
              child: OutlinedButton(
                onPressed: () {},
                child: const Text('Agregar información'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
