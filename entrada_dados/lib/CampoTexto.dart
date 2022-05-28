// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';

class CampoTexto extends StatefulWidget {
  const CampoTexto({Key? key}) : super(key: key);

  @override
  State<CampoTexto> createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de Dados"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(32),
            child: TextField(
              //text, number, emailAdress, dateTime
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Digite um valor:"),
              enabled: true,
              maxLength: 10,
              style: TextStyle(fontSize: 25, color: Colors.blue),
              //obscureText: true, //bom para senhas
              onChanged: (String e) {
                print("valor digitado é: " + e);
              },

              onSubmitted: (String e) {
                //quando envia os dados
                print("O valor submetido é: " + e);
              },
              controller: _textEditingController,
            ),
          ),
          ElevatedButton(
              child: Text("Salvar"),
              style: ElevatedButton.styleFrom(
                primary: Colors.lightGreen,
              ),
              onPressed: () {
                print("Valor digitado botão: " + _textEditingController.text);
              })
        ],
      ),
    );
  }
}
