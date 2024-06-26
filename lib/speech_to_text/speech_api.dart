import 'package:speech_to_text/speech_to_text.dart';

class SpeechApi {
  static final _speech = SpeechToText();

  static Future<bool> toggleRecording({
    required Function(String text) onResult,
    required Function(double level) onSoundLevelChange,
  }) async {
    final isAvailable = await _speech.initialize();

    if (isAvailable) {
      _speech.listen(
        onResult: (value) => onResult(
          value.recognizedWords,
        ),
        onSoundLevelChange: (level) => onSoundLevelChange(level),
      );
    }

    return isAvailable;
  }
}
