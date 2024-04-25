import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shop_ease/pages/englishQuiz/quizEnglish.dart';

class PhysicsQuizPage extends StatefulWidget {
  @override
  _PhysicsQuizPageState createState() => _PhysicsQuizPageState();
}

class  _PhysicsQuizPageState extends State<PhysicsQuizPage> {
  final List<Map<String, String>> quizData = [

      {
        "question": "What is the SI unit of force?",
        "answer": "Newton"
      },
      {
        "question": "What is the acceleration due to gravity on Earth?",
        "answer": "9.8 m/s²"
      },
      {
        "question": "What is the unit of electrical resistance?",
        "answer": "Ohm"
      },
      {
        "question": "What does the Law of Inertia state?",
        "answer": "An object at rest will stay at rest, and an object in motion will stay in motion unless acted upon by an external force"
      },
      {
        "question": "What is the SI unit of electric current?",
        "answer": "Ampere"
      },
      {
        "question": "What is the formula for kinetic energy?",
        "answer": "1/2 * mass * velocity^2"
      },
      {
        "question": "What is the SI unit of power?",
        "answer": "Watt"
      },
      {
        "question": "What is the principle of conservation of energy?",
        "answer": "Energy cannot be created or destroyed, only transformed from one form to another"
      },
      {
        "question": "What is the formula for gravitational force?",
        "answer": "G * (m1 * m2) / r^2"
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
        title: Text('Biology Quiz'),
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
                    ? 'Congratulations! You passed the quiz with a score of $score.'
                    : 'Oops! You did not pass the quiz. Your score is $score.'),
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
    home: QuizzesPage(),
  ));
}
