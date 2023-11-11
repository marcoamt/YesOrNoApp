import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(text: "Ciao!", fromWho: FromWho.me),
    Message(text: "Come va?", fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    if (text.endsWith("?")) {
      theirReply();
    }

    //in order to notify changes to ui
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> theirReply() async {
    final theirMessage = await getYesNoAnswer.getAnswer();
    messageList.add(theirMessage);

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(
        milliseconds:
            100)); //to delay scroll in order to leave flutter to update

    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
