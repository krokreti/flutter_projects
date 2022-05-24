// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, sort_child_properties_last

import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false, //retirar a faixa de debug
    title: "Frases do dia",
    home: Container(
      padding: EdgeInsets.all(30),
      margin:
          EdgeInsets.only(top: 40), //so da pra colocar o margin num container
      color: Colors.black,
      child: Column(
        //child, so pode ter um unico filho, diferente do childen
        children: [
          Text(
            "TEXTO",
            textAlign: TextAlign.justify,
            style: TextStyle(
                fontSize: 35,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                letterSpacing: 10,
                wordSpacing: 10,
                decoration: TextDecoration.underline,
                decorationColor: Colors.greenAccent,
                decorationStyle: TextDecorationStyle.dotted,
                color: Colors.black),
          ),
          Text("TEXTO 2"),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text("t2",
            style: 
            TextStyle(
              decoration: TextDecoration.none
            ),
            ),
          ),
          FlatButton(
              onPressed: () {
                print("Clicado");
              },
              child: Text(
                "Clique aqui",
                style: TextStyle(color: Colors.blue),
                
              )),
          Image.asset(
            "images/coffee.jpg",
            fit: BoxFit.contain,
            ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    ),
  ));
}
