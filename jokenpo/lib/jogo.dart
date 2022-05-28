// ignore_for_file: unused_import, prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_this

import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _Jogo();
}

class _Jogo extends State<Jogo> {
  var _imagemApp = AssetImage("images/padrao.png");
  var _mensagem = "Escolha uma opção abaixo:";

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    print(escolhaUsuario);
    print(escolhaApp);

    setState(() {
      _imagemApp = AssetImage("images/${escolhaApp}.png");
    });

    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra")) {
      setState(() {
        this._mensagem = "Você ganhou!";
      });
    } else if ((escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
        (escolhaApp == "papel" && escolhaUsuario == "pedra")) {
      setState(() {
        this._mensagem = "Você perdeu";
      });
    } else {
      setState(() {
        this._mensagem = "Empatou D:";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jokenpo"),
        backgroundColor: Colors.green,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Padding(
          padding: EdgeInsets.only(top: 32, bottom: 16),
          child: Text(
            "Escolha do App:",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Image(image: this._imagemApp),
        Padding(
          padding: EdgeInsets.only(top: 32, bottom: 16),
          child: Text(
            this._mensagem,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () => _opcaoSelecionada("pedra"),
              child: Image.asset(
                "images/pedra.png",
                height: 100,
              ),
            ),
            GestureDetector(
              onTap: () => _opcaoSelecionada("papel"),
              child: Image.asset(
                "images/papel.png",
                height: 100,
              ),
            ),
            GestureDetector(
              onTap: () => _opcaoSelecionada("tesoura"),
              child: Image.asset(
                "images/tesoura.png",
                height: 100,
              ),
            ),
            /*
            Image.asset(
              "images/pedra.png",
              height: 100,
            ),
            Image.asset(
              "images/papel.png",
              height: 100,
            ),
            Image.asset(
              "images/tesoura.png",
              height: 100,
            ),*/
          ],
        ),
      ]),
    );
  }
}
