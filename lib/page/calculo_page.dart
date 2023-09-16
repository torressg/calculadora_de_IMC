import 'package:calculadora_de_imc/model/imc.dart';
import 'package:calculadora_de_imc/page/hist_page.dart';
import 'package:calculadora_de_imc/repositories/imc_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:calculadora_de_imc/page/home_page.dart';
import 'package:calculadora_de_imc/model/imc_calculo.dart';

class CalculoPage extends StatefulWidget {
  const CalculoPage({super.key});

  @override
  State<CalculoPage> createState() => _CalculoPageState();
}

class _CalculoPageState extends State<CalculoPage> {
  TextEditingController alturaController = TextEditingController(text: "");
  TextEditingController pesoController = TextEditingController(text: "");
  final FocusNode _alturaFocus = FocusNode();
  final FocusNode _pesoFocus = FocusNode();

  calcularIMC() async {
    double IMC =
        await calcularIMCValue(alturaController.text, pesoController.text);
    showDialog(
      context: context,
      builder: (BuildContext bc) {
        return AlertDialog(
          title: Text(
            "Resultado IMC:",
            style:
                TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold),
          ),
          content: Text(
            "O seu IMC é $IMC",
            style: TextStyle(fontSize: 20),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Fechar",
                    style: TextStyle(fontWeight: FontWeight.bold))),
            TextButton(
                onPressed: () {},
                child: const Text("Conferir",
                    style: TextStyle(fontWeight: FontWeight.bold)))
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SvgPicture.asset('lib/assets/balanca.svg', height: 150),
                const SizedBox(height: 30),
                const Text(
                  "Aqui você pode calcular e armazenar seu IMC",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                const Text("Prencha com seus dados:"),
                const SizedBox(height: 40),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    controller: alturaController,
                    focusNode: _alturaFocus,
                    onFieldSubmitted: (term) {
                      _alturaFocus.unfocus();
                      FocusScope.of(context).requestFocus(_pesoFocus);
                    },
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Altura",
                      hintText: "Digite sua altura.",
                      border: OutlineInputBorder(),
                      suffixIcon: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 13, horizontal: 16),
                        child: FaIcon(
                          FontAwesomeIcons.rulerVertical,
                          color: Colors.blueGrey,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    controller: pesoController,
                    focusNode: _pesoFocus,
                    onFieldSubmitted: (value) {
                      _pesoFocus.unfocus();
                      calcularIMC();
                    },
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Peso",
                      hintText: "Digite seu peso.",
                      border: OutlineInputBorder(),
                      suffixIcon: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 13, horizontal: 10),
                        child: FaIcon(
                          FontAwesomeIcons.weightScale,
                          color: Colors.blueGrey,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    width: double.infinity,
                    height: 40,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: ElevatedButton(
                        onPressed: () {
                          calcularIMC();
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromRGBO(105, 240, 174, 1))),
                        child: const Text(
                          "CALCULAR",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(2.0, 2.0),
                                  blurRadius: 0.0,
                                  color: Color.fromARGB(54, 0, 0, 0),
                                )
                              ]),
                        )))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
