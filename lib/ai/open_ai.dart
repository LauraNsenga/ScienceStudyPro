import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/foundation.dart';

class OpenAIService {
  static final OpenAIService _instance = OpenAIService._internal();

  factory OpenAIService() => _instance;

  final requestMessages = <OpenAIChatCompletionChoiceMessageModel>[];

  OpenAIService._internal() {

    OpenAI.apiKey = const String.fromEnvironment('api_key');
    final systemMessage = OpenAIChatCompletionChoiceMessageModel(
      content: [
        OpenAIChatCompletionChoiceMessageContentItemModel.text(
          "You will be provided with Biology, Physics, and Chemistry questions. "
            "Classify each query into the respective subject and respond to users in "
            "plain text.\n"
            "\n"
            "Biology Questions and Answers:\n"
            "1. Question: What is photosynthesis?\n"
            "   Answer: Photosynthesis is the process by which green plants and some other organisms use sunlight to synthesize foods with the help of chlorophyll.\n"
            "\n"
            "2. Question: What is DNA?\n"
            "   Answer: DNA, or deoxyribonucleic acid, is a self-replicating material that is present in nearly all living organisms. It is the carrier of genetic information.\n"
            "\n"
            "Physics Questions and Answers:\n"
            "1. Question: What is Newton's first law of motion?\n"
            "   Answer: Newton's first law of motion states that an object will remain at rest or in uniform motion in a straight line unless acted upon by an external force.\n"
            "\n"
            "2. Question: What is gravity?\n"
            "   Answer: Gravity is a force of attraction that exists between any two masses, any two bodies, any two particles, or any combination of these.\n"
            "\n"
            "Chemistry Questions and Answers:\n"
            "1. Question: What is an atom?\n"
            "   Answer: An atom is the smallest unit of ordinary matter that forms a chemical element. It consists of a nucleus surrounded by electrons.\n"
            "\n"
            "2. Question: What is a chemical reaction?\n"
            "   Answer: A chemical reaction is a process that leads to the transformation of one set of chemical substances to another set of chemical substances.\n", )
      ],
      role: OpenAIChatMessageRole.system,
    );

    requestMessages.add(systemMessage);
  }

  Future<String?> chat(String userMessage) async {
    _addMessage(isFromUser: true, message: userMessage);

    OpenAIChatCompletionModel chatCompletion =
    await OpenAI.instance.chat.create(
      model: "gpt-3.5-turbo",
      seed: 6,
      messages: requestMessages,
      temperature: 0.2,
      maxTokens: 500,
    );
    final text = chatCompletion.choices.last.message.content?.first.text;

    if (text == null) {
      if (kDebugMode) {
        print('Something went wrong');
      }
    } else {
      _addMessage(isFromUser: false, message: text);

      if (kDebugMode) {
        print('${chatCompletion.usage.promptTokens}\t$text');
      }
    }

    return text;
  }

  void _addMessage({required String message, required bool isFromUser}) {
    final userMessage = OpenAIChatCompletionChoiceMessageModel(
      content: [
        OpenAIChatCompletionChoiceMessageContentItemModel.text(message),
      ],
      role: isFromUser
          ? OpenAIChatMessageRole.user
          : OpenAIChatMessageRole.assistant,
    );
    requestMessages.add(userMessage);
  }
}
