import 'person.dart';

enum Mode { Inicio, Termino }

class Chamada {
  final String nome;
  final String situacao;

  Chamada(this.nome, this.situacao);
}

class Presenca {
  final String id;
  final Mode mode;
  List<Chamada> chamada;

  Presenca(this.chamada, {required this.id, required this.mode});
}
