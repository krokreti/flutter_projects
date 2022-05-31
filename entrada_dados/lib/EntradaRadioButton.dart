import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class EntradaRadioButton extends StatefulWidget {
  const EntradaRadioButton({Key? key}) : super(key: key);

  @override
  State<EntradaRadioButton> createState() => _EntradaRadioButtonState();
}

class _EntradaRadioButtonState extends State<EntradaRadioButton> {
  String _entradaDados = "";
  String _entradaDadosTile = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada Radio Button"),
      ),
      body: Container(
        child: Column(
          children: [
            Text("Masculino"),
            Radio(
                value: "m",
                groupValue: _entradaDados,
                onChanged: (escolha) {
                  print("escolhido foi: " + escolha.toString());
                  setState(() {
                    _entradaDados = escolha.toString();
                  });
                }),
            Text("Feminino"),
            Radio(
                value: "f",
                groupValue: _entradaDados,
                onChanged: (escolha) {
                  print("escolhido foi: " + escolha.toString());
                  setState(() {
                    _entradaDados = escolha.toString();
                  });
                }),
            RadioListTile(
                title: Text("Masculino"),
                value: "m",
                groupValue: _entradaDadosTile,
                onChanged: (escolha) {
                  setState(() {
                    _entradaDadosTile = escolha.toString();
                  });
                }),
            RadioListTile(
                title: Text("Feminino"),
                value: "f",
                groupValue: _entradaDadosTile,
                onChanged: (escolha) {
                  setState(() {
                    _entradaDadosTile = escolha.toString();
                  });
                }),
            ElevatedButton(
                onPressed: () {
                  print("Comida brasileira: ${_entradaDadosTile.toString()}");
                },
                child: Text("Salvar"))
          ],
        ),
      ),
    );
  }
}
