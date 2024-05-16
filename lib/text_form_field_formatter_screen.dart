import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TextFormFieldFormatterScreen extends StatefulWidget {
  const TextFormFieldFormatterScreen({super.key});

  @override
  State<TextFormFieldFormatterScreen> createState() => _TextFormFieldFormatterScreenState();
}

class _TextFormFieldFormatterScreenState extends State<TextFormFieldFormatterScreen> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _controller,
                  inputFormatters: [
                    CurrencyInputFormatter(),
                  ],
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter amount',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Formatted value: ${_controller.text}',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ));
  }
}

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // Remove any non-numeric characters and dot (.) if it's not followed by "00"
    String text = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    // Auto-correct to XX.XX format
    if (text.isNotEmpty) {
      if (text.length == 1) {
        text = '$text.00';
      } else {
        text = '${text.substring(0, text.length - 2)}.${text.substring(text.length - 2)}';
      }
    }

    // Correct cursor position
    int cursorPosition = newValue.selection.start;
    if (cursorPosition > text.length) {
      cursorPosition = text.length;
    }

    return TextEditingValue(
      // text: text.isEmpty && hasValueBeforeDot(text) ? '' : text, // Don't show 0.00 when text is empty
      text: text.isEmpty
          ? ''
          : hasValueBeforeDot(text)
              ? text
              : '', // Don't show 0.00 when text is empty
      selection: TextSelection.collapsed(offset: cursorPosition),
    );
  }
}

bool hasValueBeforeDot(String text) {
  final dotIndex = text.indexOf('.');
  return dotIndex != -1 && dotIndex != 0;
}
