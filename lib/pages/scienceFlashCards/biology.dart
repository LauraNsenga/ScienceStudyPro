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
    // Add more questions and answers here
    {'question': 'What is the name of the pigment responsible for photosynthesis?', 'answer': 'Chlorophyll'},
    {'question': 'Which organelle is responsible for protein synthesis?', 'answer': 'Ribosome'},
    {'question': 'What is the scientific name for the process of cell division?', 'answer': 'Mitosis'},
    {'question': 'What is the process by which plants lose water vapor through their leaves?', 'answer': 'Transpiration'},
    {'question': 'What are the tiny hair-like structures on the surface of some cells called?', 'answer': 'Cilia'},
    {'question': 'What is the process by which organisms break down glucose to release energy without using oxygen?', 'answer': 'Fermentation'},
    {'question': 'What is the fluid inside a cell that contains organelles called?', 'answer': 'Cytoplasm'},
    {'question': 'Which scientist is known as the father of genetics?', 'answer': 'Gregor Mendel'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biology'),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.white, // Set background color to white
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: quizData.length,
          itemBuilder: (context, index) {
            return Card(
              color: index % 2 == 0 ? Colors.lightGreen[100] : Colors.lightGreen[200],
              elevation: 4,
              margin: EdgeInsets.only(bottom: 16),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
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
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
