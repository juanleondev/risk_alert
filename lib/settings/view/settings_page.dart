import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:risk_alert/settings/cubit/settings_cubit.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(),
      child: const _SettingsView(),
    );
  }
}

class _SettingsView extends StatelessWidget {
  const _SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        children: [
          const Text(
            'Configuración',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
          ),
          const SizedBox(
            height: 29,
          ),
          BlocBuilder<SettingsCubit, SettingsState>(
            builder: (context, state) {
              return SwitchListTile.adaptive(
                value: state.shareLocation,
                onChanged: (_) {
                  context.read<SettingsCubit>().onTapSwitch1();
                },
                title: const Text(
                  'Compartir ubicación automáticamente al abrir el app.',
                ),
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<SettingsCubit, SettingsState>(
            builder: (context, state) {
              return SwitchListTile.adaptive(
                value: state.shareWithButton,
                onChanged: (_) {
                  context.read<SettingsCubit>().onTapSwitch2();
                },
                title: const Text(
                  'Compartir ubicación al presionar 2 veces el botón de'
                  ' encendido.',
                ),
              );
            },
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
