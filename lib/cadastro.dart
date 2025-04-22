import 'dart:developer';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Cadastro extends StatelessWidget {
  const Cadastro({super.key});

  @override
  Widget build(BuildContext context) {
    final apiUrl = "http://192.168.15.79:8000/api/produto";
    TextEditingController nomeController = TextEditingController();
    TextEditingController precoController = TextEditingController();
    TextEditingController codigoController = TextEditingController();
    TextEditingController descricaoController = TextEditingController();
    Future<void> sendRequest() async {
      var response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "nome": nomeController.text,
          "preco":  precoController.text,
          "codigo_barra": codigoController.text,
          "descricao": descricaoController.text,
        }),
      );
      if(response.statusCode == 201){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Produto cadastrado com sucesso')));
      }
      else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Não foi possível cadastrar')));
      }
    }

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
          spacing: 10,
          children: [
            TextField(
              controller: nomeController,
              decoration: inputStyle('Nome', 'Maquiagem')),
            TextField(
              controller: precoController,
              keyboardType: TextInputType.number,
              decoration: inputStyle('Preço', '0.00'),
            ),
            TextField(
              controller: codigoController,
              keyboardType: TextInputType.number,
              decoration: inputStyle('Código de Barra', '00000'),
            ),
            TextField(
              controller: descricaoController,
              decoration: inputStyle('Descrição', 'Produto de alta qualidade'),
            ),
            ElevatedButton(
              onPressed: sendRequest,
              child: Text('Cadastrar Produto'),
            ),
          ],
     
        ),
      ),
    );
  }
}
