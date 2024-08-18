import 'package:flutter/material.dart';
import 'package:store/main.dart';

class mySnakbar{

  String msg;

  mySnakbar(this.msg){
    SnackBar(
        content:Text(
          msg,
          style: TextStyle(fontWeight: FontWeight.normal),
        ),
    );
  }
}