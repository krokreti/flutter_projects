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
    String url =
        "https://api.pancakeswap.info/api/v2/tokens/0x0E09FaBB73Bd3Ade0a17ECC321fD13a19e81cE82";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map<String, dynamic> retorno = json.decode(response.body);
      String brl = retorno['data']['price'];
      double preco = double.parse(brl);

      setState(() {
        _valorBtc = 'USD ${preco.toStringAsFixed(2).toString()}';
      });
    } else {
      throw Exception("fetching error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset("images/cake_banner.png"),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                child: Text(
                  _valorBtc,
                  style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: _atualizarValorBtc,
                style: ElevatedButton.styleFrom(
                    primary: Colors.amber[800],
                    fixedSize: const Size(150, 50),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero)),
                child: const Text("Atualizar"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Image.asset("images/cake_logo2.png"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
