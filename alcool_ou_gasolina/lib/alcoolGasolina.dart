// ignore_for_file: prefer_const_constructors, prefer_final_fields, sort_child_properties_last, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class alcoolGasolina extends StatefulWidget {
  const alcoolGasolina({Key? key}) : super(key: key);

  @override
  State<alcoolGasolina> createState() => _alcoolGasolinaState();
}

class _alcoolGasolinaState extends State<alcoolGasolina> {
  TextEditingController _textoAlcool = TextEditingController();
  TextEditingController _textoGasolina = TextEditingController();
  String _textoResultado = "";

  void _calcular() {
    double precoAlcool = double.parse(_textoAlcool.text);
    double precoGasolina = double.parse(_textoGasolina.text);
    double resultadoDivisao;

    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        _textoResultado =
            "Número inválido. Digite números maiores que 0 e com (.)";
      });
      limparCampos();
    } else {
      resultadoDivisao = precoAlcool / precoGasolina;
      if (resultadoDivisao >= 0.7) {
        setState(() {
          _textoResultado = "É melhor abastecer com Gasolina";
        });
      } else {
        setState(() {
          _textoResultado = "É melhor abastecer com Álcool";
        });
      }
      print("");
    }
  }

  void limparCampos() {
    _textoAlcool.text = "";
    _textoGasolina.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Álcool ou Gasolina",
        ),
        backgroundColor: Colors.green,
      ),
      body: Container(
          child: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 32),
              child: Image.asset("images/logo.png"),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                "Saiba qual a melhor opção para abastecimento do seu carro",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Preço Álcool, ex: 1.59"),
              style: TextStyle(fontSize: 22),
              controller: _textoAlcool,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(labelText: "Preço Gasolina, ex: 3.15"),
              style: TextStyle(fontSize: 22),
              controller: _textoGasolina,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: ElevatedButton(
                child: Text(
                  "Calcular",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(20),
                  primary: Colors.lightGreen,
                ),
                onPressed: _calcular,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                _textoResultado,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
