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
  Nome('3S', id: 'a1', nome: 'Carlos'),
  Nome('2S', id: 'a2', nome: 'Cleiton'),
  Nome('2S', id: 'a3', nome: 'Claudio'),
];
