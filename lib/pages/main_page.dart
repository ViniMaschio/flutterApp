import 'package:flutter/material.dart';
import 'package:myapp/pages/cep_page.dart';
import 'package:myapp/pages/configuracao_page.dart';
import 'package:myapp/pages/dados_cadastrais_page.dart';
import 'package:myapp/pages/privacidades_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Home Page"), backgroundColor: const Color.fromARGB(255, 153, 153, 152), centerTitle: true),
        drawer: Drawer(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: double.infinity,
                    child: Text("Bem Vido ao App", textAlign: TextAlign.center),
                  ),
                ),
                Divider(),
                InkWell(
                  child: Container(padding: EdgeInsets.symmetric(vertical: 10), width: double.infinity, child: Text("Dados Cadastrais")),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const DadosCadastraisPage()));
                  },
                ),
                Divider(),
                InkWell(
                  child: Container(padding: EdgeInsets.symmetric(vertical: 10), width: double.infinity, child: Text("Configurações")),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ConfiguracaoPage()));
                  },
                ),
                Divider(),
                InkWell(
                  child: Container(padding: EdgeInsets.symmetric(vertical: 10), width: double.infinity, child: Text("Termos de Uso")),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const PrivacidadesPage()));
                  },
                ),
                Divider(),
                InkWell(
                  child: Container(padding: EdgeInsets.symmetric(vertical: 10), width: double.infinity, child: Text("Busca Cep")),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const CepPage()));
                  },
                ),
              ],
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [const Text("Bem Vindo ao App"), const SizedBox(height: 20)],
          ),
        ),
      ),
    );
  }
}
