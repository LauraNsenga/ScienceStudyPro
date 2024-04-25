import 'dart:math';
import 'package:flutter/material.dart';

class PaginaQuizFisica extends StatefulWidget {
  const PaginaQuizFisica({Key? key}) : super(key: key);

  @override
  _EstadoPaginaQuizFisica createState() => _EstadoPaginaQuizFisica();
}

class _EstadoPaginaQuizFisica extends State<PaginaQuizFisica> {
  final List<Map<String, String>> datosQuiz = [
    {
      'question': '¿Cuál es la unidad SI de la fuerza?',
      'answer': 'Newton',
    },
    {
      'question': '¿Cuál es la aceleración debido a la gravedad en la Tierra?',
      'answer': '9,8 m/s²',
    },
    {
      'question': '¿Cuál es la unidad de la resistencia eléctrica?',
      'answer': 'Ohmio',
    },
    {
      'question': '¿Qué establece la Ley de Inercia?',
      'answer':
      'Un objeto en reposo permanecerá en reposo y un objeto en movimiento permanecerá en movimiento a menos que actúe sobre él una fuerza externa',
    },
    {
      'question': '¿Cuál es la unidad SI de la corriente eléctrica?',
      'answer': 'Amperio',
    },
    {
      'question': '¿Cuál es la fórmula de la energía cinética?',
      'answer': '1/2 * masa * velocidad^2',
    },
    {
      'question': '¿Cuál es la unidad SI de la potencia?',
      'answer': 'Vatio',
    },
    {
      'question': '¿Cuál es el principio de conservación de la energía?',
      'answer':
      'La energía no puede ser creada ni destruida, solo transformada de una forma a otra',
    },
    {
      'question': '¿Cuál es la fórmula de la fuerza gravitacional?',
      'answer': 'G * (m1 * m2) / r^2',
    },
    {
      'question': '¿Cuál es la unidad SI de la presión?',
      'answer': 'Pascal',
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
      final indice = random.nextInt(datosQuiz.length);
      indicesSeleccionados.add(indice);
    }

    return indicesSeleccionados
        .map((indice) => datosQuiz[indice])
        .toList(growable: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz de Física'),
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
          itemBuilder: (context, index) {
            final pregunta = preguntasSeleccionadas[index];
            final List<String> opciones = opcionesPreguntas[index];
            final seSeleccionoRespuesta =
            _respuestasSeleccionadas.containsKey(index);
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
                      'Pregunta ${index + 1}: ${pregunta['question']}',
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
                            groupValue: _respuestasSeleccionadas[index],
                            value: opcion,
                            onChanged: seSeleccionoRespuesta
                                ? null
                                : (valor) {
                              setState(() {
                                _respuestasSeleccionadas[index] =
                                valor as String?;
                              });
                            },
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 8),
                    if (seSeleccionoRespuesta)
                      _respuestasSeleccionadas[index] == pregunta['answer']
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
          final puntaje = calcularPuntaje();
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Resultado del Quiz'),
                content: Text(puntaje >= 7
                    ? '¡Felicidades! Pasaste el quiz con un puntaje de $puntaje.'
                    : '¡Ups! No pasaste el quiz. Tu puntaje es de $puntaje.'),
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
      final indiceAleatorio = Random().nextInt(datosQuiz.length);
      final opcion = datosQuiz[indiceAleatorio]['answer'];
      if (!todasOpciones.contains(opcion)) {
        todasOpciones.add(opcion!);
      }
    }

    todasOpciones.shuffle();
    return todasOpciones;
  }

  int calcularPuntaje() {
    int puntaje = 0;
    for (int i = 0; i < preguntasSeleccionadas.length; i++) {
      final pregunta = preguntasSeleccionadas[i];
      final respuestaCorrecta = pregunta['answer'];
      final respuestaSeleccionada = _respuestasSeleccionadas[i];
      if (respuestaSeleccionada == respuestaCorrecta) {
        puntaje++;
      }
    }
    return puntaje;
  }
}
