class Produto 
{
  int? id;
  String? nome;
  int? preco; // ← Por algum motivo não funciona se for double
  String? descricao;
  Produto({this.id, this.nome, this.preco, this.descricao});

  Produto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    preco = json['preco'];
    descricao = json['descricao'];
  }

}