import 'package:flutter/material.dart';
import 'package:shop_ease/spanish/spanish_homepage.dart';

class ChemistryPageSpanish extends StatelessWidget {
  final List<Map<String, String>> quizData = [
      {
        "question": "¿Cuál es el símbolo químico del agua?",
        "answer": "H2O"
      },
      {
        "question": "¿Cuál es el número atómico del oxígeno?",
        "answer": "8"
      },
      {
        "question": "¿Cuál es la fórmula del ácido sulfúrico?",
        "answer": "H2SO4"
      },
      {
        "question": "¿Cuál es el símbolo químico del sodio?",
        "answer": "Na"
      },
      {
        "question": "¿Cuál es el gas más abundante en la atmósfera terrestre?",
        "answer": "Nitrógeno"
      },
      {
        "question": "¿Para qué se utiliza la escala de pH?",
        "answer": "Para medir la acidez o alcalinidad de una sustancia"
      },
      {
        "question": "¿Cuál es el símbolo químico del oro?",
        "answer": "Au"
      },
      {
        "question": "¿Cuál es la fórmula química de la sal de mesa?",
        "answer": "NaCl"
      },
      {
        "question": "¿Cómo se llama el proceso de dividir átomos?",
        "answer": "Fisión nuclear"
      },
      {
        "question": "¿Cuál es el símbolo químico del helio?",
        "answer": "He"
      },
      {
        "question": "¿Cuál es el nombre del proceso mediante el cual las plantas producen su propio alimento?",
        "answer": "Fotosíntesis"
      },
      {
        "question": "¿Cuál es el símbolo químico del carbono?",
        "answer": "C"
      },
      {
        "question": "¿Cómo se llama el proceso de combinar elementos para formar nuevas sustancias?",
        "answer": "Reacción química"
      },
      {
        "question": "¿Cuál es el nombre de la sustancia que acelera una reacción química sin ser consumida?",
        "answer": "Catalizador"
      },
      {
        "question": "¿Cuál es la fórmula química del peróxido de hidrógeno?",
        "answer": "H2O2"
      },
      {
        "question": "¿Cuál es el nombre de la fuerza que mantiene unidos a los átomos en una molécula?",
        "answer": "Enlace químico"
      },
      {
        "question": "¿Cuál es el símbolo químico del hierro?",
        "answer": "Fe"
      },
      {
        "question": "¿Cómo se llama el proceso de remover electrones de un átomo o molécula?",
        "answer": "Ionización"
      },
      {
        "question": "¿Cuál es la fórmula química del metano?",
        "answer": "CH4"
      },
      {
        "question": "¿Cuál es el nombre del proceso por el cual un líquido se convierte en gas a su punto de ebullición?",
        "answer": "Vaporización"
      },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Química'),
        backgroundColor: Colors.green, // Set app bar color to green
      ),
      backgroundColor: Colors.white, // Set background color to white
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: quizData.length,
          itemBuilder: (context, index) {
            // Determine the color of the question box
            Color boxColor = index % 2 == 0 ? Colors.lightGreen.shade100 : Colors.lightGreen.shade200;

            return Container(
              margin: EdgeInsets.only(bottom: 16.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: boxColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pregunta ${index + 1}:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '${quizData[index]['question']}',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Respuesta:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '${quizData[index]['answer']}',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
