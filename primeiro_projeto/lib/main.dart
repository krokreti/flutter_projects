// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, sort_child_properties_last

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: Text("Titulo do APP"),
        backgroundColor: Colors.lightBlue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Text("Conteúdo do app"),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Text("Texto teste",
              style: TextStyle(
                color: Colors.white
              )),
              Text("Testando cor fadeout",
              style: TextStyle(
                color: Colors.white30
              ),),
            ],
          ),
        ),
      ),
    ),
  ));
}
