import 'package:http/http.dart' as http;
import 'dart:convert';

const CHAVE_YOUTUBE_API = "AIzaSyDRDNElhOj5FfxSgI6a1CiTwaHDSAI5VKM";
const ID_CANAL = "UCY7DbK7_jICFhm_r6VdzGsA";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {
  pesquisar(String pesquisa) async {
    http.Response response = await http.get(Uri.parse(URL_BASE +
        "search"
            "?part=snippet"
            "&type=video"
            "&maxResults=5"
            "&order=date"
            "&key=${CHAVE_YOUTUBE_API}"
            "&channelId=${ID_CANAL}"
            "&q=${pesquisa}"));

    if (response.statusCode == 200) {
      // print("resultado " + response.body);

      Map<String, dynamic> dadosJson = json
          .decode(response.body); //tem q decodificar o json pra pegar os dados
      //print("resultado " + dadosJson[""]);
      //print("resultado " + dadosJson["pageInfo"]["totalResults"].toString());
      //print("resultado " + dadosJson["items"].toString()); //pega todos os videos do canal
      //print("resultado " + dadosJson["items"][0].toString());
      print(
          "resultado " + dadosJson["items"][0]["snippet"]["title"].toString());
    } else {}
  }
}
