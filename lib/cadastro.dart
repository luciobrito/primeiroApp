import 'dart:developer';

import 'package:flutter/material.dart';

class Cadastro extends StatelessWidget {
  const Cadastro({super.key});

  @override
  Widget build(BuildContext context) {
    InputDecoration inputStyle(String label, String hint) => InputDecoration(
      hintText: hint,
      label: Text(label),
      border: OutlineInputBorder(),
      
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar produto'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Container(
        margin: EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(decoration: inputStyle('Nome', 'Maquiagem')),
            TextField(
              keyboardType: TextInputType.number,
              decoration: inputStyle('Preço', '0.00'),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: inputStyle('Código de Barra', '00000'),
            ),
            TextField(
              decoration: inputStyle('Descrição', 'Produto de alta qualidade'),
            ),
            ElevatedButton(
              onPressed: () => log('Botão apertado'),
              child: Text('Cadastrar Produto'),
            ),
          ],
          spacing: 10,
        ),
      ),
    );
  }
}
