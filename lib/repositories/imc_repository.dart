import 'package:calculadora_de_imc/model/imc.dart';

final imcRepository = ImcRepository();

class ImcRepository {
  final List<imcClass> _imc = [];

  Future<void> adicionarIMC(imcClass imc) async {
    await Future.delayed(const Duration(milliseconds: 200));
    _imc.add(imc);
  }

  Future<List<imcClass>> listarIMCs() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return _imc;
  }
}
