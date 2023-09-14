import 'package:calculadora_de_imc/page/calculo_page.dart';
import 'package:calculadora_de_imc/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          textTheme: GoogleFonts.robotoTextTheme()),
      home: HomePage(),
    );
  }
}
