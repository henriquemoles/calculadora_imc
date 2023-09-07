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
  String message = '';

  void calcularImc() {
    imc = peso / ((altura * altura) * 0.0001);
    if (imc <= 18.5) {
      message = 'Abaixo do Peso';
    } else if (imc >= 18.6 && imc <= 24.9) {
      message = 'Peso Normal';
    } else if (imc >= 25 && imc <= 29.9) {
      message = 'Sobrepeso';
    } else if (imc >= 30 && imc <= 34.9) {
      message = 'Obesidade grau 1';
    } else if (imc >= 35 && imc <= 39.9) {
      message = 'Obesidade grau 2';
    } else {
      message = 'Obesidade grau 3';
    }
  }
}
