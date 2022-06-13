import 'dart:convert';

import 'package:consumo_json_project/Post.dart';
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
  String _urlBase = "https://jsonplaceholder.typicode.com";

  Future<List<Post>> _recuperarPostagens() async {
    http.Response response = await http.get(Uri.parse(_urlBase + "/posts"));
    var dadosJson = json.decode(response.body);

    print(dadosJson);
    List<Post> postagens = [];

    print(postagens);
    for (var post in dadosJson) {
      print("post: " + post["title"]);
      Post p = Post(post["userId"], post["id"], post["title"], post["body"]);
      postagens.add(p);
    }

    return postagens;
  }

  _post() async {
    Post post = new Post(120, 1, "Titulo", "corpo");
    var corpo = json.encode(post.toJson());

    http.Response response = await http.post(Uri.parse(_urlBase + "/posts"),
        headers: {'Content-type': 'application/json; charset=UTF-8'},
        //body: jsonEncode(
        //    {"id": 101, "title": 'foo', "body": 'bar', "userId": 1}));
        body: corpo);

    print("Resposta: ${response.statusCode}");
    print("Resposta: ${response.body}");
  }

  _put() async {
    http.Response response = await http.put(Uri.parse(_urlBase + "/posts/1"),
        headers: {'Content-type': 'application/json; charset=UTF-8'},
        body: jsonEncode({
          "id": 101,
          "title": 'titulo alterado',
          "body": 'alterado',
          "userId": 1
        }));

    print("Resposta: ${response.statusCode}");
    print("Resposta: ${response.body}");
  }

  _patch() async {
    http.Response response = await http.patch(Uri.parse(_urlBase + "/posts/1"),
        headers: {'Content-type': 'application/json; charset=UTF-8'},
        body: jsonEncode({
          "id": 101,
          "title": 'titulo alterado',
        }));

    print("Resposta: ${response.statusCode}");
    print("Resposta: ${response.body}");
  }

  _delete() async {
    http.Response response =
        await http.delete(Uri.parse(_urlBase + "/posts/1"));

    if (response.statusCode == 200) {
      //deu bom
    } else {
      //deu ruim
    }

    print("Resposta: ${response.statusCode}");
    print("Resposta: ${response.body}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Consumo de servico Json"),
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  ElevatedButton(onPressed: _post, child: Text("Salvar")),
                  ElevatedButton(onPressed: _patch, child: Text("Alterar")),
                  ElevatedButton(onPressed: _delete, child: Text("Remover")),
                ],
              ),
              Expanded(
                child: FutureBuilder<List<Post>>(
                  future: _recuperarPostagens(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        print("None");
                        break;
                      case ConnectionState.active:
                        print("Active");
                        break;
                      case ConnectionState.waiting:
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                        break;
                      case ConnectionState.done:
                        print("Done");
                        if (snapshot.hasError) {
                          print("Lista: Não carregou!");
                        } else {
                          print("Lista: carregou");
                          return ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                List<Post>? lista = snapshot.data;
                                Post post = lista![index];

                                return ListTile(
                                  title: Text(post.title),
                                  subtitle: Text(post.id.toString()),
                                );
                              });
                        }
                        break;
                    }

                    return Center(
                      child: Text(""),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
