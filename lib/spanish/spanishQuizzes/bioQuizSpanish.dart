import 'dart:math';
import 'package:flutter/material.dart';

class PaginaCuestionarioBiologia extends StatefulWidget {
  @override
  _EstadoPaginaCuestionarioBiologia createState() =>
      _EstadoPaginaCuestionarioBiologia();
}

class _EstadoPaginaCuestionarioBiologia
    extends State<PaginaCuestionarioBiologia> {
  final List<Map<String, String>> datosCuestionario = [
    {
      'question': '¿Cuál es la central energética de la célula?',
      'answer': 'Mitochondria',
    },
    {
      'question':
      '¿Cuál es el proceso mediante el cual las plantas fabrican su propio alimento?',
      'answer': 'Fotosíntesis',
    },
    {
      'question': '¿Cuál es el órgano más grande del cuerpo humano?',
      'answer': 'Piel',
    },
    {
      'question': '¿Qué tipo de células son los glóbulos rojos?',
      'answer': 'Eritrocitos',
    },
    {
      'question': '¿Cómo se llama el estudio de los fósiles?',
      'answer': 'Paleontología',
    },
    {
      'question': '¿Qué gas es esencial para la respiración?',
      'answer': 'Oxígeno',
    },
    // Añade más preguntas y respuestas aquí
    {
      'question':
      '¿Qué es el proceso mediante el cual los organismos producen descendencia?',
      'answer': 'Reproducción',
    },
    {
      'question': '¿Cuál es la función principal del sistema circulatorio?',
      'answer': 'Transportar nutrientes y oxígeno',
    },
    {
      'question': '¿Cuáles son los componentes básicos de las proteínas?',
      'answer': 'Aminoácidos',
    },
    {
      'question': '¿Cuál es la función del núcleo en una célula?',
      'answer': 'Centro de control; contiene ADN',
    },
  ];

  late List<Map<String, String>> preguntasSeleccionadas;
  late Map<int, String?> _respuestasSeleccionadas;
  late List<List<String>> opcionesPreguntas;

  @override
  void initState() {
    super.initState();
    preguntasSeleccionadas = seleccionarPreguntasAleatorias();
    _respuestasSeleccionadas = {};
    opcionesPreguntas = preguntasSeleccionadas.map((pregunta) {
      return generarOpcionesAleatorias(pregunta['answer']!);
    }).toList();
  }

  List<Map<String, String>> seleccionarPreguntasAleatorias() {
    final random = Random();
    final Set<int> indicesSeleccionados = {};

    while (indicesSeleccionados.length < 10) {
      final indice = random.nextInt(datosCuestionario.length);
      indicesSeleccionados.add(indice);
    }

    return indicesSeleccionados
        .map((indice) => datosCuestionario[indice])
        .toList(growable: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cuestionario de Biología'),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: preguntasSeleccionadas.length,
          itemBuilder: (context, indice) {
            final pregunta = preguntasSeleccionadas[indice];
            final List<String> opciones = opcionesPreguntas[indice];
            final esRespuestaSeleccionada =
            _respuestasSeleccionadas.containsKey(indice);
            return Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pregunta ${indice + 1}: ${pregunta['question']}',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Column(
                      children: opciones.map((opcion) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: RadioListTile(
                            title: Text(opcion),
                            groupValue: _respuestasSeleccionadas[indice],
                            value: opcion,
                            onChanged: esRespuestaSeleccionada
                                ? null
                                : (valor) {
                              setState(() {
                                _respuestasSeleccionadas[indice] =
                                valor as String?;
                              });
                            },
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 8),
                    if (esRespuestaSeleccionada)
                      _respuestasSeleccionadas[indice] ==
                          pregunta['answer']
                          ? Icon(Icons.check, color: Colors.green)
                          : Icon(Icons.close, color: Colors.red),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final puntuacion = calcularPuntuacion();
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Resultado del Cuestionario'),
                content: Text(
                  puntuacion >= 7
                      ? '¡Enhorabuena! Has aprobado el cuestionario con una puntuación de $puntuacion.'
                      : '¡Vaya! No has aprobado el cuestionario. Tu puntuación es $puntuacion.',
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.check),
      ),
    );
  }

  List<String> generarOpcionesAleatorias(String respuestaCorrecta) {
    final List<String> todasOpciones = [];
    todasOpciones.add(respuestaCorrecta);

    while (todasOpciones.length < 4) {
      final indiceAleatorio = Random().nextInt(datosCuestionario.length);
      final opcion = datosCuestionario[indiceAleatorio]['answer'];
      if (!todasOpciones.contains(opcion)) {
        todasOpciones.add(opcion!);
      }
    }

    todasOpciones.shuffle();
    return todasOpciones;
  }

  int calcularPuntuacion() {
    int puntuacion = 0;
    for (int i = 0; i < preguntasSeleccionadas.length; i++) {
      final pregunta = preguntasSeleccionadas[i];
      final respuestaCorrecta = pregunta['answer'];
      final respuestaSeleccionada = _respuestasSeleccionadas[i];
      if (respuestaSeleccionada == respuestaCorrecta) {
        puntuacion++;
      }
    }
    return puntuacion;
  }
}
