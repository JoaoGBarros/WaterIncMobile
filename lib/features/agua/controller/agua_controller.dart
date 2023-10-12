import 'package:app/features/agua/api/agua_api.dart';
import 'package:app/core/core.dart';
import 'package:app/core/enums/agua_unidade_enum.dart';
import 'package:app/features/auth/controller/auth_controller.dart';
import 'package:app/models/agua_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final aguaControllerProvider =
    StateNotifierProvider<AguaControllerNotifier, bool>((ref) {
  return AguaControllerNotifier(ref: ref, aguaAPI: ref.watch(aguaAPIProvider));
});

final getAguaProvider = FutureProvider((ref) {
  final aguaController = ref.watch(aguaControllerProvider.notifier);
  return aguaController.getAgua();
});

class AguaControllerNotifier extends StateNotifier<bool> {
  final Ref _ref;
  final AguaAPI _aguaAPI;
  AguaControllerNotifier({required Ref ref, required AguaAPI aguaAPI})
      : _ref = ref,
        _aguaAPI = aguaAPI,
        super(false);

  Future<List<Agua>> getAgua() async {
    final aguaList = await _aguaAPI.getAgua();
    return aguaList.map((agua) => Agua.fromMap(agua.data)).toList();
  }

  void addAgua(
      {required BuildContext context,
      required String unidade,
      required double quantidade}) async {
    state = true;

    final user = _ref.read(currentUserDetailsProvider).value!;

    Agua agua = Agua(
      quantidade: quantidade,
      unidade: unidade.toAguaEnum(),
      uid: user.uid,
    );
    print(agua);
    final res = await _aguaAPI.addAgua(agua);
    state = false;
    res.fold((l) => showSnackBar(context, l.message), (r) => null);
  }
}
