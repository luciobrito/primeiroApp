import 'package:flutter/material.dart';
import 'package:my_commerce/texto.dart';

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
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Meu primeiro app'),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          addAutomaticKeepAlives: true,
          children: [],
        ),
        floatingActionButton: FloatingActionButton(
          
          backgroundColor: Colors.blue,
          onPressed: () {
            setState(() {
              contagem++;
            });
          },
          child: Icon(Icons.add)
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
}
