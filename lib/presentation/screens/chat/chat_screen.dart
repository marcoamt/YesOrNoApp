import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/their_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://www.staynerd.com/wp-content/uploads/2021/02/chris-evans-captain-america-1.jpg"),
          ),
        ),
        title: const Text("Cpt. America"),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider =
        context.watch<ChatProvider>(); //listen to changes in chat provider

    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          //like flex 1
          Expanded(
              child: ListView.builder(
            controller: chatProvider.chatScrollController,
            itemCount: chatProvider.messageList.length,
            itemBuilder: (context, index) {
              final message = chatProvider.messageList[index];
              return (message.fromWho == FromWho.their)
                  ? TheirMessageBubble(
                      message: message,
                    )
                  : MyMessageBubble(
                      message: message,
                    );
            },
          )),
          MessageFieldBox(
            // onValueChanged: (value) => chatProvider.sendMessage(value),
            onValueChanged: chatProvider.sendMessage,
          ),
        ],
      ),
    ));
  }
}
