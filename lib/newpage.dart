import 'package:flutter/widgets.dart';

class NewPageScreen extends StatelessWidget{
      final String texto;
      const NewPageScreen(this.texto, {super.key});
      @override
  Widget build(BuildContext context) {
    return Center(child: Text(texto),);
  }  
}