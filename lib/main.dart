
import 'package:flutter/material.dart';
import 'package:my_commerce/cadastro.dart';
import 'package:my_commerce/home.dart';
import 'package:my_commerce/newpage.dart';
import 'package:my_commerce/produtosPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
      ),
      home: const MyHomePage(title: 'Meu app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _indice = 0;
  final List<Widget> _telas = [
    Home(),
    ProdutosPage(),
    NewPageScreen("Vendas")
  ];
  void onTapped(int index) {
    setState(() {
      _indice = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: _telas[_indice],

      bottomNavigationBar: BottomNavigationBar(
        //type: BottomNavigationBarType.fixed,
        currentIndex: _indice,
        onTap: onTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.house), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket), label: 'Produtos'),
          BottomNavigationBarItem(icon: Icon(Icons.point_of_sale), label: 'Vendas')
        ],
      ),
    );
  }
}
