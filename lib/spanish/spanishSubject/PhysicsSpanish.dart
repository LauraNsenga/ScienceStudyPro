import 'package:flutter/material.dart';
import 'package:shop_ease/spanish/spanish_homepage.dart';

class PhysicsPageSpanish extends StatelessWidget {
  final List<Map<String, String>> quizData = [
    {
      'question': '¿Cuál es la unidad del SI de la fuerza?',
      'answer': 'Newton',
    },
    {
      'question': '¿Cuál es la aceleración debido a la gravedad en la Tierra?',
      'answer': '9.8 m/s²',
    },
    {
      'question': '¿Cuál es la unidad de resistencia eléctrica?',
      'answer': 'Ohmio',
    },
    // Agregar más preguntas y respuestas aquí
    {
      'question': '¿Qué establece la Ley de Inercia?',
      'answer': 'Un objeto en reposo permanecerá en reposo, y un objeto en movimiento permanecerá en movimiento a menos que actúe sobre él una fuerza externa',
    },
    {
      'question': '¿Cuál es la unidad del SI de la corriente eléctrica?',
      'answer': 'Ampere',
    },
    {
      'question': '¿Cuál es la fórmula para la energía cinética?',
      'answer': '1/2 * masa * velocidad^2',
    },
    {
      'question': '¿Cuál es la unidad del SI de la potencia?',
      'answer': 'Vatio',
    },
    {
      'question': '¿Cuál es el principio de conservación de la energía?',
      'answer': 'La energía no puede ser creada ni destruida, solo transformada de una forma a otra',
    },
    {
      'question': '¿Cuál es la fórmula para la fuerza gravitacional?',
      'answer': 'G * (m1 * m2) / r^2',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Física'),
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
