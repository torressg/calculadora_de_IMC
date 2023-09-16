import 'package:flutter/material.dart';

class imcClass {
  final String _id = UniqueKey().toString();
  final DateTime data = DateTime.now();
  double _peso = 0;
  double _altura = 0;
  double _imc = 0;

  imcClass(this._peso, this._altura, this._imc);

  String get id => _id;

  double get peso => _peso;

  double get altura => _altura;

  double get imc => _imc;

  set peso(double peso) {
    _peso = peso;
  }

  set altura(double altura) {
    _altura = altura;
  }

  set imc(double imc) {
    _imc = imc;
  }
}
