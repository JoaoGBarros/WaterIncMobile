import 'package:app/commons/common.dart';
import 'package:app/commons/loading_page.dart';
import 'package:app/constraints/constants.dart';
import 'package:app/features/auth/controller/auth_controller.dart';
import 'package:app/features/auth/view/login_view.dart';
import 'package:app/features/auth/widgets/auth_field.dart';
import 'package:app/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpView extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const SignUpView());
  const SignUpView({super.key});

  @override
  ConsumerState<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
  final appBar = UIConstants.appBar();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void onSignup() {
    ref.read(authControllerProvider.notifier).signUp(
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
                            onTap: onSignup,
                            backgroundColor: Pallete.whiteColor,
                            label: 'SignUp',
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
                                text: "Already have an accouunt?",
                                children: [
                              TextSpan(
                                  text: ' Log in',
                                  style: const TextStyle(
                                      color: Pallete.blueColor, fontSize: 16),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                          context, LoginView.route());
                                    }),
                            ]))
                      ],
                    )),
              ),
            ),
    );
  }
}
