
import 'package:flutter/material.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  final TextEditingController _controlador = TextEditingController();

  String? _mensagemErro;
  String? _termoPesquisado;

  // Realiza e valida a pesquisa
  void _pesquisar() {
    String termo = _controlador.text.trim()
        .replaceAll(RegExp(r'\s+'), ' ');

    if (termo.isEmpty) {
      setState(() {
        _mensagemErro =
        "Digite o nome de uma receita. Não use apenas espaços.";
        _termoPesquisado = null;
      });
      return;
    }

    setState(() {
      _mensagemErro = null;
      _termoPesquisado = termo;
    });

    FocusScope.of(context).unfocus();
  }

  // Limpa a pesquisa para uma nova consulta
  void _limparPesquisa() {
    _controlador.clear();

    setState(() {
      _mensagemErro = null;
      _termoPesquisado = null;
    });
  }

  @override
  void dispose() {
    _controlador.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFBF0),

      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Row(
          children: [
            Icon(Icons.pets, color: Colors.black),
            SizedBox(width: 10),
            Text(
              "PraJá",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Colors.black),
            onPressed: () {
              Navigator.pushNamed(context, '/perfil');
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.amber.shade100,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.amber),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bem-vindo ao PraJá!",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Receitas rápidas e deliciosas para você!",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Buscar receitas",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            // Campo de pesquisa
            TextField(
              controller: _controlador,
              textInputAction: TextInputAction.search,
              onSubmitted: (_) => _pesquisar(),
              decoration: InputDecoration(
                labelText: "Nome da receita",
                hintText: "Ex.: Pizza Margherita",
                prefixIcon: const Icon(Icons.search),
                border: const OutlineInputBorder(),
                errorText: _mensagemErro,
              ),
            ),

            const SizedBox(height: 15),

            // Botão pesquisar
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _pesquisar,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(15),
                ),
                child: const Text("Pesquisar"),
              ),
            ),

            // Feedback da pesquisa válida
            if (_termoPesquisado != null) ...[
              const SizedBox(height: 20),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.amber.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Pesquisa realizada!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Você pesquisou por: "$_termoPesquisado"',
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Os resultados serão implementados futuramente.",
                    ),
                  ],
                ),
              ),
            ],

            const SizedBox(height: 10),

            // Permite uma nova pesquisa
            TextButton(
              onPressed: _limparPesquisa,
              child: const Text(
                "Limpar / Nova pesquisa",
                style: TextStyle(color: Colors.black),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "Receitas disponíveis",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "Selecione uma receita para ver o preparo!",
            ),

            const SizedBox(height: 15),


            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.amber),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/images/img.png',
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 15),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pizza Margherita",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text("Tempo: 35 minutos"),
                        Text("Dificuldade: Fácil"),
                      ],
                    ),
                  ),
                  const Icon(Icons.favorite_border),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
