import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:risk_alert/login/login.dart';
import 'package:risk_alert/onboarding/cubit/onboarding_cubit.dart';
import 'package:risk_alert/onboarding/widgets/custom_page_indicator.dart';
import 'package:risk_alert/register/view/register_page.dart';
import 'package:risk_alert/theme/colors.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit(totalPages: 3),
      child: const _OnboardingView(),
    );
  }
}

class _OnboardingView extends StatefulWidget {
  const _OnboardingView({Key? key}) : super(key: key);

  @override
  State<_OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<_OnboardingView> {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 57.5, vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: PageView(
                      controller: pageController,
                      onPageChanged:
                          context.read<OnboardingCubit>().onPageChanged,
                      children: const [
                        _Page(
                          gsUrl: 'https://i.ibb.co/wds0Jyf/image-3.png',
                          description:
                              'Amet minim mollit non deserunt ullamco est sit'
                              ' aliqua dolor do amet sint. Velit officia'
                              ' consequat duis enim velit mollit. Exercitation'
                              ' veniam consequat sunt nostrud amet.',
                          title: 'Sample text',
                        ),
                        _Page(
                          gsUrl: 'https://i.ibb.co/wds0Jyf/image-3.png',
                          description: 'description',
                          title: 'title',
                        ),
                        _Page(
                          gsUrl: 'https://i.ibb.co/wds0Jyf/image-3.png',
                          description: 'description',
                          title: 'title',
                        ),
                      ],
                    ),
                  ),
                ),
                BlocBuilder<OnboardingCubit, int>(
                  builder: (context, state) {
                    final _currentPage = state;
                    return Column(
                      children: [
                        CustomPageIndicator(
                          length: context.read<OnboardingCubit>().totalPages,
                          selectedIndex: _currentPage,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        if (_currentPage == 2)
                          const _LoginButton()
                        else
                          _NextButton(
                            pageController: pageController,
                          ),
                        const SizedBox(
                          height: 10,
                        ),
                        if (_currentPage == 2)
                          const _RegisterButton()
                        else
                          _OmitButton(
                            pageController: pageController,
                          )
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NextButton extends StatelessWidget {
  const _NextButton({Key? key, required this.pageController}) : super(key: key);
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 260,
      height: 42,
      child: ElevatedButton(
        onPressed: () {
          pageController.nextPage(
            duration: const Duration(milliseconds: 400),
            curve: Curves.decelerate,
          );
          context.read<OnboardingCubit>().onNextButtonTap();
        },
        child: const Text('Siguiente'),
      ),
    );
  }
}

class _OmitButton extends StatelessWidget {
  const _OmitButton({Key? key, required this.pageController}) : super(key: key);
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 260,
      height: 42,
      child: TextButton(
        onPressed: () {
          pageController.animateToPage(
            context.read<OnboardingCubit>().totalPages - 1,
            duration: const Duration(milliseconds: 400),
            curve: Curves.decelerate,
          );
        },
        child: const Text('Saltar'),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 260,
      height: 42,
      child: ElevatedButton(
        onPressed: () => Navigator.push<dynamic>(
          context,
          MaterialPageRoute<dynamic>(builder: (_) => const LoginPage()),
        ),
        child: const Text('Iniciar Sesión'),
      ),
    );
  }
}

class _RegisterButton extends StatelessWidget {
  const _RegisterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 260,
      height: 42,
      child: OutlinedButton(
        onPressed: () => Navigator.push<dynamic>(
          context,
          MaterialPageRoute<dynamic>(builder: (_) => const RegisterPage()),
        ),
        child: const Text('Registrarme'),
      ),
    );
  }
}

class _Page extends StatelessWidget {
  const _Page({
    Key? key,
    required this.gsUrl,
    required this.description,
    required this.title,
  }) : super(key: key);
  final String gsUrl;
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 260,
          height: 222,
          child: Image.network(gsUrl),
        ),
        const SizedBox(
          height: 21,
        ),
        SizedBox(
          width: 260,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              color: primaryColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 260,
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
        )
      ],
    );
  }
}
