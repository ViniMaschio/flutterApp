import 'package:flutter/material.dart';
import 'package:myapp/pages/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _senhaVisivel = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  void _loginFuntion() {
    if (_emailController.text.trim() == "email@gmail.com" && _senhaController.text.trim() == "123456") {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainPage()));
    } else {
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: const Text("Erro", textAlign: TextAlign.center),
              content: const Text("E-mail ou senha inválidos"),
              actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text("OK", textAlign: TextAlign.center))],
            ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(239, 96, 95, 95),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              const Icon(Icons.person, size: 200, color: Colors.white),
              _loginHeader(),
              Column(
                children: [
                  _inputField(controller: _emailController, hintText: "Informe seu e-mail", icon: Icons.email),
                  _passwordField(
                    controller: _senhaController,
                    senhaVisivel: _senhaVisivel,
                    onToggleVisibility: () => setState(() => _senhaVisivel = !_senhaVisivel),
                  ),
                  _loginButton(onPressedFunction: _loginFuntion),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _loginHeader() {
  return Column(
    children: const [
      SizedBox(height: 30),
      Text("Já possui cadastro?", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 26)),
      SizedBox(height: 10),
      Text("Faça seu login e make the change", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 16)),
    ],
  );
}

Widget _inputField({required TextEditingController controller, required String hintText, required IconData icon}) {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.grey[300],
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25), borderSide: BorderSide.none),
        prefixIcon: Icon(icon),
      ),
    ),
  );
}

Widget _passwordField({required TextEditingController controller, required bool senhaVisivel, required VoidCallback onToggleVisibility}) {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
    child: TextField(
      controller: controller,
      obscureText: !senhaVisivel,
      decoration: InputDecoration(
        hintText: "Informe sua senha",
        filled: true,
        fillColor: Colors.grey[300],
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25), borderSide: BorderSide.none),
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(onPressed: onToggleVisibility, icon: Icon(senhaVisivel ? Icons.visibility : Icons.visibility_off)),
      ),
    ),
  );
}

Widget _loginButton({required VoidCallback onPressedFunction}) {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
    child: ElevatedButton(
      onPressed: onPressedFunction,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[300],
        foregroundColor: Colors.grey[800],
        padding: const EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      ),
      child: const Text("Entrar"),
    ),
  );
}
