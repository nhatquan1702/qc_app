import 'package:chat_app/mvvm/model/chat_message.dart';
import 'package:flutter/material.dart';
import 'chat_screen.dart';

// ignore: must_be_immutable
class ChatBubble extends StatefulWidget {
  ChatMessage chatMessage;
  ChatBubble({Key? key, required this.chatMessage}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _ChatBubbleState createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
      child: Align(
        alignment: (widget.chatMessage.type == MessageType.Receiver
            ? Alignment.topLeft
            : Alignment.topRight),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: (widget.chatMessage.type == MessageType.Receiver
                    ? Theme.of(context).cardColor
                    : Theme.of(context).primaryColor)
                .withOpacity(0.5),
          ),
          padding: const EdgeInsets.all(16),
          child: Text(widget.chatMessage.message),
        ),
      ),
    );
  }
}
