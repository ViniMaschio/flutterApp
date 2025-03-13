import 'package:flutter/material.dart';

class DadosCadastraisPage extends StatefulWidget {
  const DadosCadastraisPage({super.key});

  @override
  State<DadosCadastraisPage> createState() => _DadosCadastraisStatePage();
}

class _DadosCadastraisStatePage extends State<DadosCadastraisPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dados Cadastrais"),
        backgroundColor: const Color.fromARGB(255, 231, 51, 6),
        centerTitle: true,
      ),
      body: Center(child: Text("Dados Cadastrais")),
    );
  }
}
