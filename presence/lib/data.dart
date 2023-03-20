import 'package:flutter/material.dart';

class Nome {
  final String id;
  final String nome;
  final String posto;

  const Nome(
    this.posto, {
    required this.id,
    required this.nome,
  });
}

const NOMES = [
  Nome('A', id: 'a1', nome: 'Carlos'),
  Nome('B', id: 'a2', nome: 'Cleiton'),
  Nome('C', id: 'a3', nome: 'Claudio'),
];
