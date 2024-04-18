import 'package:flutter/material.dart';
import 'package:shop_ease/pages/bio_quiz.dart';
import 'package:shop_ease/pages/phys.quiz.dart';
import 'package:shop_ease/pages/chem_quiz.dart';
import 'package:shop_ease/spanish/spanish_homepage.dart';

class QuizzesPageSpanish extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cuestionarios', textAlign: TextAlign.center),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 127, 45, 214),
      ),
      backgroundColor: Color.fromARGB(255, 14, 200, 237),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<String>(
              hint: Text('Seleccionar cuestionario'),
              onChanged: (String? value) {
                if (value != null) {
                  switch (value) {
                    case 'Biología':
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BiologyQuizPage(),
                        ),
                      );
                      break;
                    case 'Física':
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PhysicsQuizPage(),
                        ),
                      );
                      break;
                    case 'Química':
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChemistryQuizPage(),
                        ),
                      );
                      break;
                  }
                }
              },
              items: <String>['Biología', 'Física', 'Química']
                  .map<DropdownMenuItem<String>>(
                    (String value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(value + ' Cuestionario'),
                ),
              )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}


class SubjectScreen extends StatelessWidget {
  final String subject;

  SubjectScreen({required this.subject});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subject),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Text(
          '¡Bienvenido a la pantalla de $subject!',
          style: TextStyle(fontSize: 24),
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
