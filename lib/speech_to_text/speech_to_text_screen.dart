import 'package:flutter/material.dart';
import 'package:flutter_mixup_tries_project/speech_to_text/speech_api.dart';

class SpeechToTextScreen extends StatefulWidget {
  const SpeechToTextScreen({super.key});

  @override
  State<SpeechToTextScreen> createState() => _SpeechToTextScreenState();
}

class _SpeechToTextScreenState extends State<SpeechToTextScreen> {
  String text = 'Press the Button and start speaking';
  double level = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Speech Demo'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 32,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: 40,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(blurRadius: .26, spreadRadius: level * 1.5, color: Colors.black.withOpacity(.05))],
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(50)),
        ),
        child: IconButton(
          icon: const Icon(Icons.mic),
          onPressed: () => toggleRecording(),
        ),
      ),
    );
  }

  Future toggleRecording() => SpeechApi.toggleRecording(
        onResult: (text) => setState(() => this.text = text),
        onSoundLevelChange: (level) => setState(() => this.level = level),
      );
}
