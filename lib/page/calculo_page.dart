import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CalculoPage extends StatefulWidget {
  const CalculoPage({super.key});

  @override
  State<CalculoPage> createState() => _CalculoPageState();
}

class _CalculoPageState extends State<CalculoPage> {
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
                        onPressed: () {},
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
