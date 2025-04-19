import 'package:flutter/material.dart';

class Historico extends StatelessWidget {
  const Historico({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historico'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          children: [
            Text("Aqui está o seu histórico:"),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Voltar ao início"),
            ),
          ],
        ),
      ),
      
    );
  }
}
