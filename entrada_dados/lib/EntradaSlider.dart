import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class EntradaSlider extends StatefulWidget {
  @override
  State<EntradaSlider> createState() => _EntradaSliderState();
}

class _EntradaSliderState extends State<EntradaSlider> {
  double _entradaSlider = 0;
  String label = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada Slider"),
      ),
      body: Container(
        child: Column(
          children: [
            Slider(
                value: _entradaSlider,
                min: 0,
                max: 10,
                divisions: 5,
                label: label,
                activeColor: Colors.red,
                inactiveColor: Colors.purple,
                thumbColor: Colors.black,
                onChanged: (valor) {
                  print("O valor é: " + valor.toString());
                  setState(() {
                    _entradaSlider = valor;
                    label = ("Valor Selecionado: " + valor.toString());
                  });
                }),
          ],
        ),
      ),
    );
  }
}
