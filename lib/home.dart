import 'package:flutter/material.dart';
import 'package:my_commerce/historico.dart';

class Home extends StatelessWidget{
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Bem vindo, clique no botão com sinal de \'+\' para cadastrar um produto'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Historico()),
                );
              },
              
              child: const Text('Histórico'),
            ),
            Container(decoration: BoxDecoration(border: Border.all(width: 2), color: Colors.black),)
          ],
        ),
      );
  }
}