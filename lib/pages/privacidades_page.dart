import 'package:flutter/material.dart';

class PrivacidadesPage extends StatefulWidget {
  const PrivacidadesPage({super.key});

  @override
  State<PrivacidadesPage> createState() => _PrivacidadesPageState();
}

class _PrivacidadesPageState extends State<PrivacidadesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Política de Privacidade"), backgroundColor: Color.fromARGB(255, 153, 153, 152), centerTitle: true),
      body: const Center(child: Text("Política de Privacidade")),
    );
  }
}
