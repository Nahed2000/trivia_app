import 'package:flutter/material.dart';

class TextCodeNode extends StatelessWidget {
  const TextCodeNode({
    Key? key,
    required this.focusNode,
    required this.textController,
    required this.onPress,
  }) : super(key: key);

  final TextEditingController textController;
  final FocusNode focusNode;
  final void Function(String value) onPress;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      focusNode: focusNode,
      textAlign: TextAlign.center,
      keyboardType:
          const TextInputType.numberWithOptions(signed: false, decimal: false),
      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      maxLength: 1,
      onChanged: onPress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.grey, width: 1),
        ),
        counterText: '',
      ),
    );
  }
}
