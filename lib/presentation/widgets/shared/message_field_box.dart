import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValueChanged;
  const MessageFieldBox({super.key, required this.onValueChanged});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusControl = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));

    final inputDecoration = InputDecoration(
      hintText: 'End your message with a "?"',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          onPressed: () {
            final textVal = textController.value.text;
            onValueChanged(textVal);
            textController.clear();
          }),
    );

    return TextFormField(
      onTapOutside: (event) {
        focusControl.unfocus();
      },
      focusNode: focusControl,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        textController.clear();
        focusControl.requestFocus();
        onValueChanged(value);
      },
      // onChanged: (value) {
      //   print("changed $value");
      // },
    );
  }
}
