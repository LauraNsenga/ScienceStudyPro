import 'package:flutter/material.dart';

import 'chat_widget.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ScienceStudyPro'),
        backgroundColor: Colors.green[300],
      ),
      body: const ChatWidget(),
    );
  }
}
