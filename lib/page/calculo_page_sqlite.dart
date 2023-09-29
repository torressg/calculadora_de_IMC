import 'package:calculadora_de_imc/model/imc_sqlite_model.dart';
import 'package:calculadora_de_imc/repositories/sqlite/imc_sqlite_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:calculadora_de_imc/model/imc_calculo.dart';
import 'package:intl/intl.dart';

class CalculoSQLitePage extends StatefulWidget {
  final PageController controller;

  const CalculoSQLitePage({Key? key, required this.controller}) : super(key: key);

  @override
  State<CalculoSQLitePage> createState() => _CalculoSQLitePageState();
}

class _CalculoSQLitePageState extends State<CalculoSQLitePage> {
  IMCSQLiteRepository imcRepository = IMCSQLiteRepository();
  TextEditingController alturaController = TextEditingController(text: "");
  TextEditingController pesoController = TextEditingController(text: "");
  final FocusNode _alturaFocus = FocusNode();
  final FocusNode _pesoFocus = FocusNode();
  int id = 0;

  msgIMC(imc) {
    if (imc < 18.5) {
      return "De acordo com a OMS, você está abaixo do peso.";
    } else if (imc > 18.6 && imc < 24.9) {
      return "De acordo com a OMS, você está com peso ideal.";
    } else if (imc > 15 && imc < 29.9) {
      return "De acordo com a OMS, você está levemente acima do peso.";
    } else if (imc > 30 && imc < 34.9) {
      return "De acordo com a OMS, você está com obesidade grau 1.";
    } else if (imc > 35 && imc < 39.9) {
      return "De acordo com a OMS, você está com obesidade grau 2.";
    } else if (imc > 40) {
      return "De acordo com a OMS, você está com obesidade grau 3.";
    }
  }

  calcularIMC() async {
    print(pesoController.text);
    print(alturaController.text);
    double IMC =
        await calcularIMCValue(alturaController.text, pesoController.text);
    String descricao = msgIMC(IMC);
    String data = DateFormat("dd/MM/yyyy").format(DateTime.now());

    IMCSQLiteModel novoRegistro = IMCSQLiteModel(
      id: id, 
      peso: double.parse(pesoController.text), 
      altura: double.parse(alturaController.text), 
      imc: IMC, 
      data: data, 
      desc: descricao
    );
    // ignore: use_build_context_synchronously
    showDialog(
      context: context,
      builder: (BuildContext bc) {
        return AlertDialog(
          title: Text(
            "O seu IMC é $IMC",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                msgIMC(IMC),
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              Text("Confira os resultados anteriores.")
            ],
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Fechar",
                    style: TextStyle(fontWeight: FontWeight.bold))),
            TextButton(
                onPressed: () {
                  widget.controller.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                  Navigator.pop(context);
                },
                child: const Text("Conferir",
                    style: TextStyle(fontWeight: FontWeight.bold)))
          ],
        );
      },
    );
     await imcRepository.salvar(novoRegistro);
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
                      pesoController.text = "";
                      alturaController.text = "";
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
                          pesoController.text = "";
                          alturaController.text = "";
                          
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
