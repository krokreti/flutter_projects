import 'package:flutter/material.dart';

class EntradaCheckBox extends StatefulWidget {
  const EntradaCheckBox({Key? key}) : super(key: key);

  @override
  State<EntradaCheckBox> createState() => _EntradaCheckBoxState();
}

class _EntradaCheckBoxState extends State<EntradaCheckBox> {
  bool _estaSelecionado = false;
  bool _estaSelecionado1 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada Dados"),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CheckboxListTile(
                title: Text("Comida Brasileira"),
                subtitle: Text("A melhor comida do mundo"),
                activeColor: Colors.green,
                // selected: true,
                secondary: Icon(Icons.ac_unit),
                value: _estaSelecionado1,
                onChanged: (valorSelecao) {
                  setState(() {
                    _estaSelecionado1 = valorSelecao!;
                  });
                }),

            CheckboxListTile(
                title: Text("Comida Mexicana"),
                subtitle: Text("A melhor comida do mundo"),
                activeColor: Colors.red,
                // selected: true,
                secondary: Icon(Icons.food_bank),
                value: _estaSelecionado,
                onChanged: (valor) {
                  setState(() {
                    _estaSelecionado = valor!;
                  });
                }),

            ElevatedButton(
                onPressed: () {
                  print(
                      "Comida brasileira: ${_estaSelecionado1.toString()} \n" +
                          "Comida Mexicana ${_estaSelecionado.toString()} ");
                },
                child: Text("Salvar"))

            // Text("Comida Brasileira"),
            // Checkbox(
            //   value: _estaSelecionado,
            //   onChanged: (valor) {
            //     setState(() {
            //       _estaSelecionado = valor!;
            //     });
            //     print("checkbox: " + _estaSelecionado.toString());
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
