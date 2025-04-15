import 'dart:convert';
import 'package:http/http.dart' as http;

class Produto {
  int? id;
  String? nome;
  double? preco;
  String? codigoBarra;
  String? descricao;
  int? qntEstoque;
  Produto({
    this.id,
    this.codigoBarra,
    this.descricao,
    this.nome,
    this.preco,
    this.qntEstoque,
  });

  factory Produto.fromJson(Map<String, dynamic> json) {
    return switch (json){
      {'id': int id, 'nome': String nome, 'codigo_barra': String codigoBarra, 'descricao' : String descricao} => Produto(id: id, nome: nome, codigoBarra: codigoBarra, descricao: descricao),
      _ => throw const FormatException("Não foi possível carregar produtos"),
    };
  }
  static Future<String> produtoE() async {
    var url = Uri.parse("http://192.168.15.79:8000/api/produto");
    final response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );
    return response.body;
  }
}
