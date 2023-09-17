import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class imcClass {
  final String _id = UniqueKey().toString();
  final String data = DateFormat("dd/MM/yyyy").format(DateTime.now());
  double _peso = 0;
  double _altura = 0;
  String _imc = "";

  imcClass(this._peso, this._altura, this._imc);

  String get id => _id;

  double get peso => _peso;

  double get altura => _altura;

  String get imc => _imc;

  set peso(double peso) {
    _peso = peso;
  }

  set altura(double altura) {
    _altura = altura;
  }

  set imc(String imc) {
    _imc = imc;
  }
}
