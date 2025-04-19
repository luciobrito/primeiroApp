import 'package:flutter/material.dart';
import 'package:my_commerce/cadastro.dart';

class ProdutosPage extends StatelessWidget {
  const ProdutosPage({super.key});
  @override
  Widget build(BuildContext context) {
    void abrirFormulario() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Cadastro()),
      );
    }

    return Scaffold(
      body: ElevatedButton(onPressed: ()=>{}, child: Text('Estoque')),
      floatingActionButton: FloatingActionButton(
        onPressed: abrirFormulario,
        child: Icon(Icons.add),
      ),
    );
  }
}
