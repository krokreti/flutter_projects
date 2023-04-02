import 'package:flutter/material.dart';
import 'package:presence/models/presenca.dart';
import '../models/person.dart';

class PersonControl with ChangeNotifier {
  late Presenca _presenca;

  Presenca get presenca {
    return _presenca;
  }

  void addPresenca() {}
}
