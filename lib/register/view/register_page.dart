import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:risk_alert/add_contacts/add_contacts.dart';
import 'package:risk_alert/register/cubit/register_cubit.dart';
import 'package:risk_alert/widgets/custom_text_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrarme'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        children: [
          const Text(
            '¡Inicia una vida segura!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
          ),
          const SizedBox(
            height: 26,
          ),
          const CustomTextField(
            title: 'DNI',
            hintText: 'Ingrese su número de DNI',
          ),
          const SizedBox(
            height: 31,
          ),
          CustomTextField(
            title: 'Fecha de emisión',
            hintText: 'Ingrese su fecha de emisión',
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.help_outline,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: 31,
          ),
          const CustomTextField.password(
            title: 'Contraseña',
            hintText: 'Ingrese su contraseña',
          ),
          const SizedBox(
            height: 31,
          ),
          const CustomTextField.password(
            title: 'Confirmar contraseña',
            hintText: 'Ingrese nuevamente su contraseña',
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 50, top: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocBuilder<RegisterCubit, RegisterState>(
              builder: (context, state) {
                return CheckboxListTile(
                  value: state.acceptTermsAndConditions,
                  onChanged: (_) {
                    context.read<RegisterCubit>().onCheckTermsAndConditions();
                  },
                  title: const Text(
                    'Al registrarme acepto todos los términos y '
                    'condiciones de la aplicación',
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                );
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 57.5,
              ),
              child: SizedBox(
                width: 260,
                height: 42,
                child: ElevatedButton(
                  onPressed: () => Navigator.push<dynamic>(
                    context,
                    MaterialPageRoute<dynamic>(
                      builder: (_) => const AddContactsPage(
                        isFirstShow: true,
                      ),
                    ),
                  ),
                  child: const Text('Registrarme'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
