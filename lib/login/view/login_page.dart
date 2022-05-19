import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:risk_alert/add_contacts/add_contacts.dart';
import 'package:risk_alert/login/cubit/login_cubit.dart';
import 'package:risk_alert/widgets/custom_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(),
      child: const _LoginView(),
    );
  }
}

class _LoginView extends StatelessWidget {
  const _LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iniciar sesión'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        children: const [
          Text(
            '¡Seguros una vez más!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
          ),
          SizedBox(
            height: 26,
          ),
          CustomTextField(
            title: 'DNI',
            hintText: 'Ingrese su número de DNI',
          ),
          SizedBox(
            height: 36,
          ),
          CustomTextField.password(
            title: 'Contraseña',
            hintText: 'Ingrese su contraseña',
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 57.5, vertical: 50),
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
            child: const Text('Iniciar sesión'),
          ),
        ),
      ),
    );
  }
}
