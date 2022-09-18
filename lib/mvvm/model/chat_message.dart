import 'package:chat_app/mvvm/view/screen/chat/chat_screen.dart';

class ChatMessage{
  String message;
  MessageType type;
  ChatMessage({required this.message, required this.type});
}