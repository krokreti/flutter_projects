import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _resultado = "";
  TextEditingController _controller = TextEditingController();

  _recuperarCep() async {
//    String cep = "26560510";
    String cep = _controller.text;
    String url = "https://viacep.com.br/ws/${cep}/json/";

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map<String, dynamic> retorno = json.decode(response.body);
//      String logradouro = retorno["logradouro"];
      String logradouro = "${retorno['logradouro']} " +
          "\nBairro: ${retorno['bairro']}" +
          "\nCidade: ${retorno['localidade']}" +
          "\nEstado: ${retorno['uf']}";
      print("\n " + response.body);

      setState(() {
        _resultado = logradouro;
      });
    } else {
      throw Exception('Failed to load');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de serviço Web"),
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Digite o cep:"),
                controller: _controller,
              ),
            ),
            ElevatedButton(
              onPressed: _recuperarCep,
              child: Text("Clique Aqui"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text(_resultado),
            )
          ],
        ),
      ),
    );
  }
}
