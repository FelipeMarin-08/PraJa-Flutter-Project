
import 'package:flutter/material.dart';
import 'package:flutterprojeto/Perfil.dart';
import 'package:flutterprojeto/TelaPrincipal.dart';

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // Tela que aparece ao abrir o aplicativo
      home: const TelaPrincipal(),

      // Outras telas do aplicativo
      routes: {
        '/perfil': (context) => const Perfil(),
      },
    );
  }
}
