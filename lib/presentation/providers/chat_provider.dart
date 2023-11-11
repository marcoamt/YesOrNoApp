import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: "Ciao!", fromWho: FromWho.me),
    Message(text: "Come va?", fromWho: FromWho.me),
  ];

  void sendMessage(String text) async {
    //TODO: implement method
  }
}
