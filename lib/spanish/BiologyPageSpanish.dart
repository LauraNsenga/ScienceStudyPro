import 'package:flutter/material.dart';
import 'package:shop_ease/spanish/spanish_homepage.dart';

class BiologyPageSpanish extends StatelessWidget {
  final List<Map<String, String>> quizData = [
  {
  'question': '¿Cuál es la central energética de la célula?',
  'answer': 'Mitocondria'
},
{
'question': '¿Cuál es el proceso mediante el cual las plantas elaboran su propio alimento?',
'answer': 'Fotosíntesis'
},
{
'question': '¿Cuál es el órgano más grande del cuerpo humano?',
'answer': 'Piel'
},
{
'question': '¿Qué tipo de células son los glóbulos rojos?',
'answer': 'Eritrocitos'
},
{
'question': '¿Cómo se llama el estudio de los fósiles?',
'answer': 'Paleontología'
},
{
'question': '¿Qué gas es esencial para la respiración?',
'answer': 'Oxígeno'
},
{
'question': '¿Cuál es el proceso mediante el cual los organismos producen descendencia?',
'answer': 'Reproducción'
},
{
'question': '¿Cuál es la función principal del sistema circulatorio?',
'answer': 'Transporte de nutrientes y oxígeno'
},
{
'question': '¿Cuáles son los componentes básicos de las proteínas?',
'answer': 'Aminoácidos'
},
{
'question': '¿Cuál es la función del núcleo en una célula?',
'answer': 'Centro de control; contiene ADN'
},
{
'question': '¿Cuál es el proceso de convertir los alimentos en energía?',
'answer': 'Respiración celular'
},
{
'question': '¿Cuáles son los órganos principales del sistema respiratorio?',
'answer': 'Pulmones'
},

    // Add more translated questions and answers here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biología'),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: quizData.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pregunta ${index + 1}: ${quizData[index]['question']}',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 8),
                Text(
                  'Respuesta: ${quizData[index]['answer']}',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
              ],
            );
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SpanishHomePage(),
  ));
}
