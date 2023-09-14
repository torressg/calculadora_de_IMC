import 'package:calculadora_de_imc/page/calculo_page.dart';
import 'package:calculadora_de_imc/page/hist_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController controller = PageController(initialPage: 0);
  int posicaoPagina = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Calculadora IMC",
          style: TextStyle(fontWeight: FontWeight.w200),
        ),
      ),
      body: PageView(
        controller: controller,
        onPageChanged: (value) {
          setState(() {
            posicaoPagina = value;
          });
        },
        children: const [CalculoPage(), HistPage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            controller.jumpToPage(value);
          },
          currentIndex: posicaoPagina,
          items: const [
            BottomNavigationBarItem(
                label: "Calcular", icon: Icon(Icons.calculate_rounded)),
            BottomNavigationBarItem(label: "Histórico", icon: Icon(Icons.book)),
          ]),
    );
  }
}
