import 'package:flutter/material.dart';

class ConfiguracaoPage extends StatefulWidget {
  const ConfiguracaoPage({super.key});

  @override
  State<ConfiguracaoPage> createState() => _ConfiguracaoPageState();
}

class _ConfiguracaoPageState extends State<ConfiguracaoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Configurações"), backgroundColor: const Color.fromARGB(255, 153, 153, 152), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            ListTile(title: const Text("Notificações"), trailing: Switch(value: true, onChanged: (value) {})),
            ListTile(title: const Text("Tema Escuro"), trailing: Switch(value: false, onChanged: (value) {})),
            ListTile(
              title: const Text("Idioma"),
              trailing: DropdownButton<String>(
                value: "Português",
                items: const [
                  DropdownMenuItem(value: "Português", child: Text("Português")),
                  DropdownMenuItem(value: "Inglês", child: Text("Inglês")),
                ],
                onChanged: (value) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
