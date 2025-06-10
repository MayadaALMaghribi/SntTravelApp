import 'package:flutter/material.dart';
import 'package:sntegpito/Features/chat/presentation/views/widgets/chat_view_body.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key, required this.userName});
  final String userName;

  @override
  Widget build(BuildContext context) {
    return ChatViewBody(
      userName: userName,
    );
  }
}
