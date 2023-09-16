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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
          itemCount: _imc.length,
          itemBuilder: (BuildContext bc, int index) {
            var imc = _imc[index];
            return Dismissible(
                key: Key(imc.id),
                child: ListTile(
                  title: Text("Imc: ${imc.imc}"),
                ));
          },
        ))
      ],
    );
  }
}
