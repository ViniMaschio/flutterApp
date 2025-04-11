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
  final PageController _pageController = PageController();
  int _currentIndex = 0;
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
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          children: const [
            Center(child: Text("Home")),
            Center(child: Text("Perfil")),
            Center(child: Text("Configurações")),
            Center(child: Text("Sobre")),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              _pageController.jumpToPage(index);
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Configurações"),
            BottomNavigationBarItem(icon: Icon(Icons.info), label: "Sobre"),
          ],
        ),
      ),
    );
  }
}
