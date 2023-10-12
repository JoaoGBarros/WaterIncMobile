import 'package:app/features/user/api/user_api.dart';
import 'package:app/commons/common.dart';
import 'package:app/constraints/agua_constants.dart';
import 'package:app/features/agua/controller/agua_controller.dart';
import 'package:app/features/auth/controller/auth_controller.dart';
import 'package:app/features/home/view/home_view.dart';
import 'package:app/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddWaterScreen extends ConsumerStatefulWidget {
  const AddWaterScreen({super.key});
  static route() =>
      MaterialPageRoute(builder: (context) => const AddWaterScreen());
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddWaterScreenState();
}

class _AddWaterScreenState extends ConsumerState<AddWaterScreen> {
  bool botaoClicadoML = false;
  bool botaoClicadoL = false;
  final quantidadeTextController = TextEditingController();
  final unidadeTextController = TextEditingController();

  void onBotaoConstanteTap(String unidadeValue, String quantidadeValue) {
    setState(() {
      quantidadeTextController.text = quantidadeValue;
      unidadeTextController.text = unidadeValue;
      if (unidadeValue == AguaConstants.quantidadeML) {
        botaoClicadoML = true;
        botaoClicadoL = false;
      } else if (unidadeValue == AguaConstants.quantidadeL) {
        botaoClicadoL = true;
        botaoClicadoML = false;
      }
    });
  }

  void onBotaoAdicionarTap() {
    setState(() {
      botaoClicadoL = false;
      botaoClicadoML = false;
      quantidadeTextController.clear();
    });
  }

  void onBotoesUnidadeTap(String unidade) {
    setState(() {
      unidadeTextController.text = unidade;
      if (unidade == AguaConstants.quantidadeML) {
        botaoClicadoML = true;
        botaoClicadoL = false;
      } else if (unidade == AguaConstants.quantidadeL) {
        botaoClicadoL = true;
        botaoClicadoML = false;
      }
    });
  }

  void goBack() {
    Navigator.push(context, HomeView.route());
  }

  void addWater() {
    ref.read(aguaControllerProvider.notifier).addAgua(
        context: context,
        unidade: unidadeTextController.text,
        quantidade: double.parse(quantidadeTextController.text));
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(currentUserDetailsProvider).value;
    final isLoading = ref.watch(aguaControllerProvider);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: goBack,
          icon: const Icon(
            Icons.close,
            size: 30,
          ),
        ),
        actions: [],
      ),
      body: isLoading || currentUser == null
          ? const Loader()
          : SafeArea(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(25),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      RoundedBigButton(
                                        onTap: () => onBotaoConstanteTap(
                                            AguaConstants.quantidadeML, '300'),
                                        icon: Icons.local_drink,
                                        borderColor: Colors.blue[700]!,
                                        backgroundColor: Colors.blue[300]!,
                                        textColor: Pallete.whiteColor,
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      RoundedBigButton(
                                        onTap: () => onBotaoConstanteTap(
                                            AguaConstants.quantidadeML, '500'),
                                        icon: Icons.battery_full_outlined,
                                        borderColor: Colors.blue[700]!,
                                        backgroundColor: Colors.blue[300]!,
                                        textColor: Pallete.whiteColor,
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      RoundedBigButton(
                                        onTap: onBotaoAdicionarTap,
                                        icon: Icons.add,
                                        borderColor: Colors.blue[700]!,
                                        backgroundColor: Colors.blue[300]!,
                                        textColor: Pallete.whiteColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: SingleChildScrollView(
                      child: Column(children: [
                        Row(
                          children: [
                            // CircleAvatar(
                            //   backgroundImage: NetworkImage(currentUser.profilePic),
                            //   radius: 30,
                            // ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                                child: Center(
                              child: Column(
                                children: [
                                  TextField(
                                    readOnly: botaoClicadoL || botaoClicadoML,
                                    controller: quantidadeTextController,
                                    style: const TextStyle(fontSize: 22),
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      hintStyle: TextStyle(
                                          color: Pallete.greyColor,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600),
                                      hintText: 'Quantidade de agua',
                                      border: InputBorder.none,
                                    ),
                                    maxLength: 4,
                                    maxLines: 1,
                                  ),
                                  Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        RoundedSmallButton(
                                          onTap: () => onBotoesUnidadeTap(
                                              AguaConstants.quantidadeML),
                                          label: AguaConstants.quantidadeML,
                                          backgroundColor: Pallete.greyColor,
                                          textColor: Pallete.whiteColor,
                                          highlight: botaoClicadoML,
                                          highlghtColor:
                                              Colors.deepPurpleAccent,
                                        ),
                                        const SizedBox(
                                          width: 30,
                                        ),
                                        RoundedSmallButton(
                                          onTap: () => onBotoesUnidadeTap(
                                              AguaConstants.quantidadeL),
                                          label: AguaConstants.quantidadeL,
                                          backgroundColor: Pallete.greyColor,
                                          textColor: Pallete.whiteColor,
                                          highlight: botaoClicadoL,
                                          highlghtColor:
                                              Colors.deepPurpleAccent,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ))
                          ],
                        ),
                      ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(75),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          RoundedSmallButton(
                            onTap: addWater,
                            label: "Adicionar",
                            backgroundColor: Pallete.blueColor,
                            textColor: Pallete.whiteColor,
                            highlight: false,
                            highlghtColor: null,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
