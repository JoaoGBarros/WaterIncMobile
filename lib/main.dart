import 'package:app/commons/common.dart';
import 'package:app/commons/loading_page.dart';
import 'package:app/features/auth/controller/auth_controller.dart';
import 'package:app/features/auth/view/login_view.dart';
import 'package:app/features/home/view/home_view.dart';
import 'package:app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.theme,
        home: ref.watch(currentUserAccountProvider).when(
            data: (user) {
              return user != null ? const HomeView() : const LoginView();
            },
            error: (error, stackTrace) => ErrorPage(error: error.toString()),
            loading: () => const LoadingPage()));
  }
}
