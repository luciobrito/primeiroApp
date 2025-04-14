import 'package:flutter/material.dart';

class Texto extends StatelessWidget{
  String dados;
  Texto( this.dados);
  @override
  Widget build(BuildContext context) {
      return Center(child: Text(dados, style: TextStyle(fontSize: 20),),);
  }
}
