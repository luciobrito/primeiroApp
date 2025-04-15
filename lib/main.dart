import 'package:flutter/material.dart';
import 'package:my_commerce/texto.dart';
import 'package:my_commerce/produto.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int contagem = 1;
  Future<Produto> produtosFuture = getProdutos();
  Future<String> prodFuture = Produto.produtoE();
  static Future<Produto> getProdutos() async {
    var url = Uri.parse("http://192.168.15.79:8000/api/produto/1");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return Produto.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Não foi possivel carregar');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Meu primeiro app'),
        ),
        body: Center(
          child: FutureBuilder<Produto>(
            future: produtosFuture,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasData) {
                final produto = snapshot.data!;
                return Text("${produto.nome}");
              } else {
                return const Text("Sem dados.");
              }
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () {
            setState(() {
              contagem++;
            });
          },
          child: Icon(Icons.add),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.blue),
              label: 'Início',
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Produtos',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProdutos(List<Produto> produtos) {
    return ListView.builder(
      itemCount: produtos.length,
      itemBuilder: (context, index) {
        final produto = produtos[index];
        return Container(child: Row(children: [Text(produto.nome!)]));
      },
    );
  }
}
