import 'package:calculadora_de_imc/model/imc.dart';
import 'package:flutter/material.dart';
import 'package:calculadora_de_imc/repositories/imc_repository.dart';

class HistPage extends StatefulWidget {
  const HistPage({super.key});

  @override
  State<HistPage> createState() => _HistPageState();
}

class _HistPageState extends State<HistPage> with WidgetsBindingObserver {
  List<imcClass> _imc = <imcClass>[];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    obterIMCs();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      obterIMCs();
    }
  }

  void obterIMCs() async {
    _imc = await imcRepository.listarIMCs();
    setState(() {});
  }

  msgIMC(imc) {
    if (imc < 18.5) {
      return "Você estava abaixo do peso.";
    } else if (imc > 18.6 && imc < 24.9) {
      return "Você estava com peso ideal.";
    } else if (imc > 15 && imc < 29.9) {
      return "Você estava levemente acima do peso.";
    } else if (imc > 30 && imc < 34.9) {
      return "Você estava com obesidade grau 1.";
    } else if (imc > 35 && imc < 39.9) {
      return "Você estava com obesidade grau 2.";
    } else if (imc > 40) {
      return "Você estava com obesidade grau 3.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Text(
          "Histórico de IMCs",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        Expanded(
            child: ListView.builder(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                itemCount: _imc.length,
                itemBuilder: (BuildContext bc, int index) {
                  var imc = _imc[index];
                  return Card(
                    elevation: 3,
                    child: Column(
                      children: [
                        ListTile(
                          title: Text("Seu IMC foi ${imc.imc}"),
                          subtitle: Text(
                              "Com seu peso ${imc.peso}, altura ${imc.altura} em ${imc.data}. \n${msgIMC(double.parse(imc.imc))}"),
                        )
                      ],
                    ),
                  );
                }))
      ],
    );
  }
}
