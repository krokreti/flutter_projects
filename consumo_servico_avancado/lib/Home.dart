import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<Map> _recuperaPreco() async {
    String url = "https://blockchain.info/ticker";
    http.Response response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map>(
      future: _recuperaPreco(),
      builder: (context, snapshot) {
        String resultado = "";

        switch (snapshot.connectionState) {
          case ConnectionState.none:
            print("None");
            break;
          case ConnectionState.active:
            print("Active");
            break;
          case ConnectionState.waiting:
            print("Waiting");
            resultado = "Carregando...";
            break;
          case ConnectionState.done:
            print("Done");
            if (snapshot.hasError) {
              resultado = "Erro ao carregar dados!";
            } else {
              double valor = snapshot.data!["BRL"]["buy"];
              resultado = "Preço do Bitcoin: ${valor.toString()}";
            }
            break;
        }

        return Center(
          child: Text(resultado),
        );
      },
    );
  }
}
