// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class PhysicsPage extends StatelessWidget {
 
  final List<Map<String, String>> quizData = [
    {
      'question': 'What is the SI unit of force?',
      'answer': 'Newton',
    },
    {
      'question': 'What is the acceleration due to gravity on Earth?',
      'answer': '9.8 m/s²',
    },
   
    {
      'question': 'What is the unit of electrical resistance?',
      'answer': 'Ohm',
    },
    {
      'question': 'What does the Law of Inertia state?',
      'answer': 'An object at rest will remain at rest, and an object in motion will remain in motion unless acted upon by an external force',
    },
    
    {
      'question': 'What is the SI unit of electric current?',
      'answer': 'Ampere',
    },
    {
      'question': 'What is the formula for kinetic energy?',
      'answer': '1/2 * mass * velocity^2',
    },
    
    {
      'question': 'What is the SI unit of power?',
      'answer': 'Watt',
    },
    {
      'question': 'What is the principle of conservation of energy?',
      'answer': 'Energy cannot be created or destroyed, only transformed from one form to another',
    },
    
    {
      'question': 'What is the formula for gravitational force?',
      'answer': 'G * (m1 * m2) / r^2',
    },

    {
  'question': 'What is the SI unit of pressure?',
  'answer': 'Pascal',
  },
  {
    'question': 'What is the formula for density?',
    'answer': 'Mass / Volume',
  },
  {
    'question': 'What is the SI unit of frequency?',
    'answer': 'Hertz',
  },
  {
    'question': 'What is the principle of conservation of momentum?',
    'answer': 'The total momentum of a closed system remains constant if no external forces act on it',
  },
  {
    'question': 'What is the formula for electrical power?',
    'answer': 'Voltage * Current',
  },
  {
    'question': 'What is the SI unit of magnetic field strength?',
    'answer': 'Tesla',
  },
  {
    'question': 'What is the formula for centripetal force?',
    'answer': 'Mass * (Velocity^2 / Radius)',
  },
  {
    'question': 'What is the SI unit of frequency?',
    'answer': 'Hertz',
  },
  {
    'question': 'What is the principle of Archimedes?',
    'answer': 'An object submerged in a fluid experiences an upward buoyant force equal to the weight of the fluid it displaces',
  },
  {
    'question': 'What is the formula for Ohm\'s Law?',
    'answer': 'V = I * R (Voltage = Current * Resistance)',
  },
  {
    'question': 'What is the SI unit of electric charge?',
    'answer': 'Coulomb',
  },
  {
    'question': 'What is the formula for torque?',
    'answer': 'Force * Distance from the pivot point',
  },
  {
    'question': 'What is the principle of conservation of angular momentum?',
    'answer': 'The total angular momentum of a closed system remains constant if no external torques act on it',
  },
  {
    'question': 'What is the SI unit of capacitance?',
    'answer': 'Farad',
  },
  {
    'question': 'What is the formula for gravitational potential energy?',
    'answer': 'Mass * Gravity * Height',
  },
  {
    'question': 'What is the SI unit of electric potential?',
    'answer': 'Volt',
  },
  {
    'question': 'What is the formula for velocity?',
    'answer': 'Displacement / Time',
  },
  {
    'question': 'What is the SI unit of magnetic flux?',
    'answer': 'Weber',
  },
  {
    'question': 'What is the formula for amplitude in a wave?',
    'answer': 'Maximum displacement from equilibrium position',
  },
  {
    'question': 'What is the SI unit of resistance?',
    'answer': 'Ohm',
  },

    {
      'question': 'What is the SI unit of work?',
      'answer': 'Joule',
    },
    
    
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chemistry'),
        backgroundColor: Colors.green, // Set app bar color to green
      ),
      backgroundColor: Colors.white, // Set background color to white
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            for (var i = 0; i < quizData.length; i++)
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Question ${i + 1}: ${quizData[i]['question']}',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Answer: ${quizData[i]['answer']}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}