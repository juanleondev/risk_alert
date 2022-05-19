import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:risk_alert/add_contacts/add_contacts.dart';
import 'package:risk_alert/map_alert/cubit/map_alert_cubit.dart';
import 'package:risk_alert/onboarding/view/onboarding_page.dart';
import 'package:risk_alert/settings/settings.dart';
import 'package:risk_alert/theme/colors.dart';

class MapAlertDrawer extends StatelessWidget {
  const MapAlertDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 310,
        padding: const EdgeInsets.fromLTRB(24, 22.7, 24, 40),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ListTile(
              leading: CircleAvatar(
                backgroundColor: primaryColor,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              title: Text(
                'Nombre de usuario',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                '979769891',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: ListView(
                children: [
                  BlocBuilder<MapAlertCubit, MapAlertState>(
                    builder: (context, state) {
                      return _Item.value(
                        value: state.selectedContactsId.length,
                        title: 'Contactos',
                        icon: Icons.people,
                        onTap: () {
                          Navigator.push<dynamic>(
                            context,
                            MaterialPageRoute<dynamic>(
                              builder: (_) => const AddContactsPage(),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  _Item(
                    title: 'Configuraciones',
                    icon: Icons.settings,
                    onTap: () {
                      Navigator.push<dynamic>(
                        context,
                        MaterialPageRoute<dynamic>(
                          builder: (_) => const SettingsPage(),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.pushAndRemoveUntil<dynamic>(
                    context,
                    MaterialPageRoute<dynamic>(
                      builder: (_) => const OnboardingPage(),
                    ),
                    (Route<dynamic> route) => false,
                  );
                },
                icon: const Icon(Icons.exit_to_app),
                label: const Text('Cerrar sesión'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  })  : value = null,
        super(key: key);
  const _Item.value({
    Key? key,
    required this.value,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);
  final int? value;
  final String title;
  final IconData icon;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: primaryColor,
      ),
      child: ListTile(
        onTap: onTap,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        leading: Icon(
          icon,
          color: Colors.white,
        ),
        trailing: Visibility(
          visible: value != null,
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: const Color(0xffF2FFF7),
            ),
            child: Center(
              child: Text(
                value.toString(),
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
