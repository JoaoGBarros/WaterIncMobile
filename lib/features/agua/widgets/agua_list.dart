import 'package:app/commons/common.dart';
import 'package:app/features/agua/controller/agua_controller.dart';
import 'package:app/features/auth/controller/auth_controller.dart';
import 'package:app/models/agua_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AguaList extends ConsumerWidget {
  //final Agua agua;
  const AguaList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(getAguaProvider).when(
          data: (aguas) {
            return ListView.builder(
                itemCount: aguas.length,
                itemBuilder: (BuildContext context, int index) {
                  final agua = aguas[index];
                  Text(
                    "${agua.quantidade}  ${agua.unidade.name}",
                    style: TextStyle(color: Colors.white),
                  );
                });
          },
          error: (error, st) => ErrorText(
            error: error.toString(),
          ),
          loading: () => const Loader(),
        );
  }
}
