import 'package:calculadora_imc/components/bottom_botao.dart';
import 'package:calculadora_imc/components/card_tela.dart';
import 'package:calculadora_imc/components/constantes.dart';
import 'package:calculadora_imc/components/icon_component.dart';
import 'package:calculadora_imc/controller/calculo_imc_controller.dart';
import 'package:calculadora_imc/views/resultado_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

enum Genero {
  masculino,
  feminino,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final controller = Get.put(CalculoImcController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Calculadora de IMC'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: CardTela(
                    colour: controller.generoSelecionado == Genero.masculino
                        ? activeCardColour
                        : inactiveCardColour,
                    onPress: () {
                      setState(() {
                        controller.generoSelecionado = Genero.masculino;
                      });
                    },
                    cardChild: const IconComponent(
                      icon: FontAwesomeIcons.mars,
                      labelSexo: 'Masculino',
                    )),
              ),

              //Card Feminino
              Expanded(
                child: CardTela(
                    onPress: () {
                      setState(() {
                        controller.generoSelecionado = Genero.feminino;
                      });
                    },
                    colour: controller.generoSelecionado == Genero.feminino
                        ? activeCardColour
                        : inactiveCardColour,
                    cardChild: const IconComponent(
                      icon: FontAwesomeIcons.venus,
                      labelSexo: 'Feminino',
                    )),
              ),
            ],
          )),
          Expanded(
            child: CardTela(
              colour: activeCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Altura',
                    style: labelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        controller.altura.toString(),
                        style: numberTextStyle,
                      ),
                      const Text(
                        'cm',
                        style: labelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: const Color(0xFFEB1555),
                      overlayColor: const Color(0x29EB1555),
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: controller.altura.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          controller.altura = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
              onPress: () {},
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CardTela(
                    colour: activeCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Peso',
                          style: labelTextStyle,
                        ),
                        Text(
                          controller.peso.toString(),
                          style: numberTextStyle,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    controller.peso--;
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    controller.peso++;
                                  });
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    onPress: () {},
                  ),
                ),
              ],
            ),
          ),
          BotaoInferior(
            onTap: () {
              controller.calcularImc();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) {
                    return ResultadoPage();
                  }),
                ),
              );
            },
            buttonTitle: 'CALCULAR',
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      // ignore: sort_child_properties_last
      child: Icon(icon),

      onPressed: onPressed as void Function(),
      elevation: 0.0,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: const CircleBorder(),

      fillColor: const Color(0xFF4C4F5E),
    );
  }
}
