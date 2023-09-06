import 'package:calculadora_imc/components/bottom_botao.dart';
import 'package:calculadora_imc/components/card_tela.dart';
import 'package:calculadora_imc/components/constantes.dart';
import 'package:calculadora_imc/controller/calculo_imc_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultadoPage extends StatelessWidget {
  ResultadoPage({Key? key}) : super(key: key);

  final CalculoImcController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              child: const Text(
                'Resultado',
                style: titleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: CardTela(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'NORMAL',
                    style: resultTextStyle,
                  ),
                  Text(
                    '${controller.imc.toPrecision(2)}',
                    style: numberTextStyle,
                  ),
                  Text(
                    'Você tem um peso normal. Bom trabalho!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  )
                ],
              ),
              colour: activeCardColour,
              onPress: () {},
            ),
          ),
          BotaoInferior(
            buttonTitle: 'RECALCULAR',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
