# BMI Calculator

Flutter app that calculates your Body Mass Index, tells you where it falls on the World Health Organization scale and keeps a history of every calculation.

<p>
  <img src="https://github.com/torressg/calculadora_de_IMC/assets/126213815/85fc4302-4c51-4057-a96c-2b70af890bb7" alt="Home and calculation screens" width="200"/>
  <img src="https://github.com/torressg/calculadora_de_IMC/assets/126213815/79289a91-3d2d-4b05-8e69-cd4546f27431" alt="Result dialog" width="200"/>
  <img src="https://github.com/torressg/calculadora_de_IMC/assets/126213815/36ede43f-4987-4d70-89e4-3752f8c0c282" alt="History screen" width="200"/>
</p>

## Features

- Calculate BMI from weight and height, with WHO-based feedback
- History of past results with formatted dates
- Two versions of the storage layer: in-memory and **SQLite** (`sqflite`)
- Bottom navigation between calculator and history

## Stack

Flutter · Dart · sqflite · intl · flutter_svg · font_awesome_flutter · google_fonts

## Running

```bash
flutter pub get
flutter run
```
