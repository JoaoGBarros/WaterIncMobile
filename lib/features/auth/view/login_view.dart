import 'package:app/commons/loading_page.dart';
import 'package:app/commons/rounded_small_button.dart';
import 'package:app/constraints/ui_constants.dart';
import 'package:app/features/auth/controller/auth_controller.dart';
import 'package:app/features/auth/view/signup_view.dart';
import 'package:app/features/auth/widgets/auth_field.dart';
import 'package:app/theme/pallete.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginView extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const LoginView());
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final appBar = UIConstants.appBar();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void login() {
    ref.read(authControllerProvider.notifier).login(
          email: emailController.text,
          password: passwordController.text,
          context: context,
        );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);
    return Scaffold(
      appBar: appBar,
      body: isLoading
          ? const Loader()
          : Center(
              child: SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        AuthField(
                          controller: emailController,
                          hintText: 'Email',
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        AuthField(
                          controller: passwordController,
                          hintText: 'Senha',
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: RoundedSmallButton(
                            onTap: login,
                            backgroundColor: Pallete.whiteColor,
                            label: 'Login',
                            textColor: Pallete.backgroundColor,
                            highlight: false,
                            highlghtColor: null,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        RichText(
                            text: TextSpan(
                                text: "Dont have an accouunt?",
                                children: [
                              TextSpan(
                                  text: ' Sign up',
                                  style: const TextStyle(
                                      color: Pallete.blueColor, fontSize: 16),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                          context, SignUpView.route());
                                    }),
                            ]))
                      ],
                    )),
              ),
            ),
    );
  }
}
