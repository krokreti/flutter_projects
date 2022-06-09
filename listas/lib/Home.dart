import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _itens = [];

  _carregaItens() {
    for (var i = 0; i < 10; i++) {
      Map<String, dynamic> item = Map();
      item["titulo"] = "Titulo ${i} texto teste";
      item["descricao"] = "Descrição ${i} texto teste";
      _itens.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    _carregaItens();

    return Scaffold(
      appBar: AppBar(
        title: Text("Listas"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
            itemCount: _itens.length,
            itemBuilder: (context, indice) {
              //Map<String, dynamic> item = _itens[indice];
              //print(item["titulo"]);

              return ListTile(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          //title: Text("Titulo"),
                          title: Text(_itens[indice]["titulo"]),
                          //content: Text("Conteudo"),
                          titlePadding: EdgeInsets.all(16),
                          titleTextStyle: TextStyle(fontSize: 20),
                          content: Text(_itens[indice]["descricao"]),
                          contentTextStyle:
                              TextStyle(fontWeight: FontWeight.bold),
                          backgroundColor: Colors.lightBlue,
                          actions: [
                            TextButton(
                              onPressed: () {},
                              child: Text("Sim"),
                              style: TextButton.styleFrom(
                                  backgroundColor: Colors.white),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Fechar"),
                            ),
                          ],
                          //contentPadding: EdgeInsets.all(80),
                        );
                      });
                },
                onLongPress: () {
                  print("clique com longPress ${indice}");
                },
                title: Text(_itens[indice]["titulo"]),
                subtitle: Text(_itens[indice]["descricao"]),
              );
            }),
      ),
    );
  }
}
