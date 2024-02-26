import 'package:flutter/material.dart';
import 'package:flutter_gymapp/modelos/exercicio_modelo.dart';
import 'package:flutter_gymapp/modelos/sentimento_modelo.dart';
import 'package:flutter_gymapp/telas/minhas_cores.dart';

class ExercicioTela extends StatelessWidget {
  ExercicioTela({super.key});

  final ExercicioModelo exercicioModelo = ExercicioModelo(
      id: "001",
      nome: "Supino",
      treino: "Treino A",
      comoFazer: "Segura na mão de Deus e vai");

  final List<SentimentoModelo> listaSentimentos = [
    SentimentoModelo(
      id: "002",
      sentindo: "Pouca ativação",
      data: "2024-02-21",
    ),
    SentimentoModelo(
      id: "003",
      sentindo: "Maior ativação",
      data: "2024-02-21",
    ),
    SentimentoModelo(
      id: "002",
      sentindo: "Pouca ativação",
      data: "2024-02-21",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MinhasCores.amareloFit,
        appBar: AppBar(
          leading: Container(
            child: Image.asset(
              'assets/logo.png',
            ),
          ),
          title: Column(children: [
            Text(
              exercicioModelo.nome,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.white,
              ),
            ),
            Text(
              exercicioModelo.treino,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ]),
          centerTitle: true,
          backgroundColor: Colors.black,
          toolbarHeight: 72,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          )),
        ), // AppBar funciona como se fosse um header/menu
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              print("Clicado");
            },
            child: const Icon(Icons.add)),
        body: Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListView(
            children: [
              SizedBox(
                height: 250,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Enviar foto"),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Tirar foto"),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Como fazer?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              Text(exercicioModelo.comoFazer),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(
                  color: Colors.black,
                ),
              ),
              const Text(
                "Como estou me sentindo?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(listaSentimentos.length, (index) {
                  SentimentoModelo sentimentoAgora = listaSentimentos[index];
                  return ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: Text(sentimentoAgora.sentindo),
                    subtitle: Text(sentimentoAgora.data),
                    leading: const Icon(Icons.double_arrow_rounded),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        print("Deletar ${sentimentoAgora.sentindo}");
                      },
                    ),
                  );
                }),
              )
            ],
          ),
        ));
  }
}
