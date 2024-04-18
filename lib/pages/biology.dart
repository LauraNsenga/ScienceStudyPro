import 'package:flutter/material.dart';

class BiologyPage extends StatelessWidget {
  final List<Map<String, String>> quizData = [
    {'question': 'What is the powerhouse of the cell?', 'answer': 'Mitochondria'},
    {'question': 'What is the process by which plants make their own food?', 'answer': 'Photosynthesis'},
    {'question': 'What is the largest organ in the human body?', 'answer': 'Skin'},
    {'question': 'What type of cells are red blood cells?', 'answer': 'Erythrocytes'},
    {'question': 'What is the study of fossils called?', 'answer': 'Paleontology'},
    {'question': 'Which gas is essential for respiration?', 'answer': 'Oxygen'},
    {'question': 'What is the process by which organisms produce offspring?', 'answer': 'Reproduction'},
    {'question': 'What is the main function of the circulatory system?', 'answer': 'Transportation of nutrients and oxygen'},
    {'question': 'What are the building blocks of proteins?', 'answer': 'Amino acids'},
    {'question': 'What is the function of the nucleus in a cell?', 'answer': 'Control center; contains DNA'},
    {'question': 'What is the process of converting food into energy?', 'answer': 'Cellular respiration'},
    {'question': 'What are the primary organs of the respiratory system?', 'answer': 'Lungs'},


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biology'),
        backgroundColor: Colors.green, // Set app bar color to green
      ),
      backgroundColor: Colors.white, // Set background color to white
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: quizData.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Question ${index + 1}: ${quizData[index]['question']}',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 8),
                Text(
                  'Answer: ${quizData[index]['answer']}',
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
