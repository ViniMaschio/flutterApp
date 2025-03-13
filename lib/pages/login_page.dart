//import 'dart:math';

import 'package:flutter/material.dart';

import 'package:myapp/pages/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _senhaVisivel = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();

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
              const Icon(
                Icons.person,
                size: 200,
                color: Color.fromARGB(255, 243, 241, 241),
              ),

              SizedBox(
                width: double.infinity,
                height: 30,
                child: Text(
                  "Já possui cadastro?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 243, 241, 241),
                    fontSize: 26,
                  ),
                ),
              ),
              Container(
                //faca seu login
                width: double.infinity,
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  "Faça seu login e make the change",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 243, 241, 241),
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                //login
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: "Informe seu e-mail",
                    filled: true,
                    fillColor: Color.fromARGB(255, 220, 220, 220),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
              ),
              Container(
                //senha
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: TextField(
                  controller: _senhaController,
                  obscureText: !_senhaVisivel,
                  decoration: InputDecoration(
                    hintText: "Informe sua senha",
                    filled: true,
                    fillColor: Color.fromARGB(255, 220, 220, 220),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _senhaVisivel = !_senhaVisivel;
                        });
                      },
                      icon: Icon(
                        _senhaVisivel ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                  ),
                ),
              ),

              Container(
                //botao entrar
                width: double.infinity,

                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                    if (_emailController.text.trim() == "email@gmail.com" &&
                        _senhaController.text.trim() == "123456") {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainPage(),
                        ),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Erro", textAlign: TextAlign.center),
                            content: Text("E-mail ou senha inválidos"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("OK", textAlign: TextAlign.center),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 220, 220, 220),
                    foregroundColor: Colors.grey[800],
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Text("Entrar"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
