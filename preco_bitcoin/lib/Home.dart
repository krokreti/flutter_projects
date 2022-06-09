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
  _HomeState() {
    _atualizarValorBtc();
  }

  String _valorBtc = "";

  _atualizarValorBtc() async {
    String url = "https://blockchain.info/ticker";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map<String, dynamic> retorno = json.decode(response.body);
      Map<String, dynamic> brl = retorno['BRL'];
      //Map<String, dynamic> brl = retorno['BRL']['last'];
      print(brl['last']);
      setState(() {
        _valorBtc = "R\$ " + brl['last'].toString();
      });
    } else {
      throw Exception("O destino não está disponível");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset("images/bitcoin.png"),
            Text(
              _valorBtc,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            ElevatedButton(
              onPressed: _atualizarValorBtc,
              child: Text("Atualizar"),
              style: ElevatedButton.styleFrom(
                  primary: Colors.amber[800],
                  fixedSize: Size(150, 50),
                  shape:
                      RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
            )
          ],
        ),
      ),
    );
  }
}
