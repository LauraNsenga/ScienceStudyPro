import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shop_ease/french/frenchquizzes/quizzesFrench.dart';

class PageQuizBiologie extends StatefulWidget {
  @override
  _StatePageQuizBiologie createState() => _StatePageQuizBiologie();
}

class _StatePageQuizBiologie extends State<PageQuizBiologie> {
  final List<Map<String, String>> quizData = [
    {
      "question": "Quelle est la centrale énergétique de la cellule ?",
      "answer": "Mitochondries"
    },
    {
      "question": "Quel est le processus par lequel les plantes fabriquent leur propre nourriture ?",
      "answer": "Photosynthèse"
    },
    {
      "question": "Quel est le plus grand organe du corps humain ?",
      "answer": "Peau"
    },
    {
      "question": "Quel type de cellules sont les globules rouges ?",
      "answer": "Érythrocytes"
    },
    {
      "question": "Comment s'appelle l'étude des fossiles ?",
      "answer": "Paléontologie"
    },
    {
      "question": "Quel gaz est essentiel pour la respiration ?",
      "answer": "Oxygène"
    },
    {
      "question": "Quel est le processus par lequel les organismes produisent une descendance ?",
      "answer": "Reproduction"
    },
    {
      "question": "Quelle est la fonction principale du système circulatoire ?",
      "answer": "Transporter les nutriments et l'oxygène"
    },
    {
      "question": "Quels sont les composants de base des protéines ?",
      "answer": "Acides aminés"
    },
    {
      "question": "Quelle est la fonction du noyau dans une cellule ?",
      "answer": "Centre de contrôle ; contient de l'ADN"
    },
  ];

  List<Map<String, String>> selectedQuestions = [];
  Map<int, String?> _selectedAnswers = {};

  @override
  void initState() {
    super.initState();
    selectRandomQuestions();
  }

  void selectRandomQuestions() {
    final random = Random();
    final Set<int> selectedIndexes = {};

    while (selectedIndexes.length < 10) {
      final index = random.nextInt(quizData.length);
      selectedIndexes.add(index);
    }

    selectedQuestions = selectedIndexes
        .map((index) => quizData[index])
        .toList(growable: false);

    // Generate options for each question
    selectedQuestions.forEach((question) {
      final List<String> options = generateRandomOptions(question['answer']!);
      question['options'] = options.join(',');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Questionnaire de Biologie'),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: selectedQuestions.length,
          itemBuilder: (context, index) {
            final question = selectedQuestions[index];
            final List<String> options = question['options']!.split(',');
            final isAnswerSelected = _selectedAnswers.containsKey(index);
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
                    Container(
                      color: Colors.lightGreen[95],
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Question ${index + 1}: ${question['question']}',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Column(
                      children: options.map((option) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: RadioListTile(
                            title: Text(option),
                            groupValue: _selectedAnswers[index],
                            value: option,
                            onChanged: isAnswerSelected
                                ? null
                                : (value) {
                              setState(() {
                                _selectedAnswers[index] =
                                value as String?;
                              });
                            },
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 8),
                    if (isAnswerSelected)
                      _selectedAnswers[index] == question['answer']
                          ? Icon(Icons.check, color: Colors.green)
                          : Icon(Icons.close, color: Colors.red),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final score = calculateScore();
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Quiz Result'),
                content: Text(score >= 7
                    ? 'Félicitations ! Vous avez réussi le quiz avec un score de $score.'
                    : 'Oops ! Vous n\'avez pas réussi le quiz. Votre score est de $score.'),
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

  List<String> generateRandomOptions(String correctAnswer) {
    final List<String> allOptions = [];
    allOptions.add(correctAnswer);

    final remainingOptions = quizData
        .map((e) => e['answer']!)
        .where((element) => element != correctAnswer)
        .toList();

    final random = Random();
    while (allOptions.length < 4) {
      final randomIndex = random.nextInt(remainingOptions.length);
      final option = remainingOptions[randomIndex];
      allOptions.add(option);
      remainingOptions.removeAt(randomIndex);
    }

    allOptions.shuffle();
    return allOptions;
  }

  int calculateScore() {
    int score = 0;
    for (int i = 0; i < selectedQuestions.length; i++) {
      final question = selectedQuestions[i];
      final correctAnswer = question['answer'];
      final selectedAnswer = _selectedAnswers[i];
      if (selectedAnswer == correctAnswer) {
        score++;
      }
    }
    return score;
  }
}

void main() {
  runApp(MaterialApp(
    home: PageQuizBiologie(),
  ));
}
