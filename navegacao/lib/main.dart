import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navegacao/telaSecundaria.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {"/secundaria": (context) => TelaSecundaria()},
    home: telaPrincipal(),
    debugShowCheckedModeBanner: false,
  ));
}

class telaPrincipal extends StatefulWidget {
  const telaPrincipal({Key? key}) : super(key: key);

  @override
  State<telaPrincipal> createState() => _trocaTelasState();
}

class _trocaTelasState extends State<telaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Principal"),
        backgroundColor: Colors.red,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/secundaria");
              },
              child: Text("Ir para proxima página"),
              style: ElevatedButton.styleFrom(padding: EdgeInsets.all(15)),
            )
          ],
        ),
      ),
    );
  }
}
