import 'package:calculadora_de_imc/repositories/imc_repository.dart';
import 'package:calculadora_de_imc/model/imc.dart';

Future<double> calcularIMCValue(String alturaTexto, String pesoTexto) async {
  double alturaDouble = double.parse(alturaTexto.replaceAll(',', '.'));
  double pesoDouble = double.parse(pesoTexto.replaceAll(',', '.'));
  double IMC = pesoDouble / (alturaDouble * alturaDouble);
  await imcRepository.adicionarIMC(imcClass(pesoDouble, alturaDouble, IMC));
  return double.parse((IMC).toStringAsFixed(1));
}
