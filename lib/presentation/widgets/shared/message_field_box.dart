import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

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
            print("button $textVal");
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
        print("Submitted value $value");
        textController.clear();
        focusControl.requestFocus();
      },
      // onChanged: (value) {
      //   print("changed $value");
      // },
    );
  }
}
