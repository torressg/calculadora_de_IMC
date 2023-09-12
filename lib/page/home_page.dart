import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Calculadora IMC",
          style: TextStyle(fontWeight: FontWeight.w200),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        child: Center(
          child: Column(
            children: [
              Text(
                "Aqui você pode calcular e armazenar seu IMC",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Altura",
                    hintText: "Digite sua altura.",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(
                      Icons.height,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
