import 'package:flutter/material.dart';

class IMC {
  final String _id = UniqueKey().toString();
  final data = DateTime.now();
  double _peso = 0;
  double _altura = 0;

  IMC(this._peso, this._altura);

  String get id => _id;

  double get peso => _peso;

  double get altura => _altura;

  set peso(double peso) {
    _peso = peso;
  }

  set altura(double altura) {
    _altura = altura;
  }
}
