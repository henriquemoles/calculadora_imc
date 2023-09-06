import 'package:calculadora_imc/views/input_page_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CalculoImcController extends GetxController {
  Genero? generoSelecionado;
  int altura = 180;
  int peso = 60;
  int idade = 19;
  double imc = 0;
  String tabelaImc = '';

  void calcularImc() {
    imc = peso / ((altura * altura) * 0.0001);

    print(imc);
    print(imc)
  }
}
