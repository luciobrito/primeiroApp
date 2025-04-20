import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_commerce/cadastro.dart';
import 'package:my_commerce/models/produto.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProdutosPage extends StatefulWidget {
  const ProdutosPage({super.key});

  @override
  State<ProdutosPage> createState() => _ProdutosPageState();
}

class _ProdutosPageState extends State<ProdutosPage> {
  Future<List<Produto>> produtoFuture = getProdutos();
  static Future<List<Produto>> getProdutos() async {
    var url = Uri.parse("http://192.168.15.79:8000/api/produto");
    final response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );
    final List body = json.decode(response.body);
    return body.map((e) => Produto.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    void abrirFormulario() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Cadastro()),
      );
    }

    return Scaffold(
      body:  FutureBuilder(
            future: produtoFuture,
            builder: (context, snapshot) {

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasData) {
                log(snapshot.data![8].nome.toString());
                
                final produtos = snapshot.data!;
                return buildProdutos(produtos);
              } else {
                return const Text('Sem dados');
              }
            },
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: abrirFormulario,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget buildProdutos(List<Produto> posts) {
    // ListView Builder to show data in a list
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return Container(
          color: Colors.grey.shade300,
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          height: 130,
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(width: 10),
              Expanded(flex: 3, child: Text(post.nome!)),
              Expanded(flex: 3, child: Text(post.id!.toString())),
              Expanded(flex: 1, child:Text('R\$ ${post.preco}'))
            ],
          ),
        );
      },
    );
  }
}
