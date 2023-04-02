import 'package:flutter/material.dart';

class Person {
  final String id;
  final String nome;
  final String posto;

  const Person(
    this.posto, {
    required this.id,
    required this.nome,
  });
}
