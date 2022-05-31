import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class EntradaSwitch extends StatefulWidget {
  const EntradaSwitch({Key? key}) : super(key: key);

  @override
  State<EntradaSwitch> createState() => _EntradaSwitchState();
}

class _EntradaSwitchState extends State<EntradaSwitch> {
  bool receber = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada Switch"),
      ),
      body: Container(
        child: Column(
          children: [
            Switch(
                value: receber,
                onChanged: (valor) {
                  print("O resultado é: " + valor.toString());
                  setState(() {
                    receber = valor;
                  });
                }),
            Text("Receber Notificações"),
            SwitchListTile(
                title: Text("Receber Notificações? "),
                selectedTileColor: Colors.green,
                activeColor: Colors.green,
                value: receber,
                onChanged: (valor) {
                  print("O resultado é: " + valor.toString());
                  setState(() {
                    receber = valor;
                  });
                })
          ],
        ),
      ),
    );
  }
}
