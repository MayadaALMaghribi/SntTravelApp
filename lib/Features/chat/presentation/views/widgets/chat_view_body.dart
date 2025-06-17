import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:sntegpito/core/cache/cache_helper.dart';
import 'package:sntegpito/core/utils/assests.dart';
import 'package:sntegpito/core/utils/constant.dart';
import 'package:string_similarity/string_similarity.dart';
import '../../../../../core/helpers/faq_chat_bot.dart';

// finally i made it
class ChatViewBody extends StatefulWidget {
  const ChatViewBody({super.key, required this.userName});
  final String userName;

  @override
  State<ChatViewBody> createState() => _ChatViewBodyState();
}

class _ChatViewBodyState extends State<ChatViewBody> {
  late ChatUser _user;
  final ChatUser _bot = ChatUser(
    id: '2',
    firstName: 'SNT Bot',
    profileImage: AssetsData.chat_bot,
  );
  @override
  void initState() {
    super.initState();
    _user = ChatUser(
      id: CacheHelper().getData(key: Constants.userId).toString(),
      firstName: widget.userName,
      profileImage: CacheHelper().getData(key: "Profile_user"),
    );
    CacheHelper().saveData(key: Constants.usernamechat, value: widget.userName);
    loadMessageFromFirestore();
  }

  final List<ChatMessage> _messages = [];

  String getBestMatch(String userInput) {
    double bestScore = 0.0;
    String bestAnswer =
        "Sorry, I didn't understand that very well. I'll check it out and get back to you as soon as possible! you connet with support@sntapp.com";

    for (var item in faq) {
      double score = StringSimilarity.compareTwoStrings(
        userInput.toLowerCase(),
        item["question"]!.toLowerCase(),
      );
      if (score > bestScore) {
        bestScore = score;
        bestAnswer = item["answer"]!;
      }
    }
    return bestAnswer;
  }

  Future<void> saveMessageToFirestore(ChatMessage message) async {
    CollectionReference chat_message = FirebaseFirestore.instance
        .collection('chat_message')
        .doc(_user.id.toString())
        .collection('messages');
    await chat_message.add({
      'userId': message.user.id,
      'userName': message.user.firstName,
      'createdBy': message.createdAt.toIso8601String() ??
          DateTime.now().toIso8601String(),
      'text': message.text,
      'profileImage': message.user.profileImage ?? '',
    });
  }

  Future<void> loadMessageFromFirestore() async {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('chat_message')
        .doc(_user.id)
        .collection('messages')
        .orderBy('createdBy', descending: true)
        .get();
    final loadMessage = snapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return ChatMessage(
          user: ChatUser(
              id: data['userId'],
              firstName: data['userName'],
              profileImage: data['profileImage']),
          createdAt: DateTime.parse(data['createdBy']),
          text: data['text']);
    }).toList();
    setState(() {
      _messages.clear();
      _messages.addAll(loadMessage);
    });
  }

  void _sendMessage(ChatMessage message) {
    setState(() {
      _messages.insert(0, message);
    });
    saveMessageToFirestore(message);

    String reply = getBestMatch(message.text.trim());

    final botMessage = ChatMessage(
      user: _bot,
      createdAt: DateTime.now(),
      text: reply,
    );

    setState(() {
      _messages.insert(0, botMessage);
    });
    saveMessageToFirestore(botMessage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 134, 197, 249),
        title: Text('🤖 SNT ChatBot'),
        centerTitle: true,
      ),
      body: DashChat(
        currentUser: _user,
        onSend: _sendMessage,
        messages: _messages,
        inputOptions: InputOptions(
          inputDecoration: InputDecoration(
            hintText: "Write your question here...",
            filled: true,
            fillColor: Colors.white,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
          ),
          alwaysShowSend: true,
          sendButtonBuilder: (onSend) => IconButton(
            icon: const Icon(Icons.send, color: Colors.blueAccent),
            onPressed: onSend,
          ),
        ),
        messageOptions: const MessageOptions(
          showCurrentUserAvatar: true,
          showOtherUsersAvatar: true,
          showOtherUsersName: true,
          showTime: true,
          currentUserContainerColor: Color.fromARGB(255, 134, 197, 249),
          containerColor: Colors.white,
          textColor: Colors.black,
          currentUserTextColor: Colors.white,
          borderRadius: 20,
        ),
      ),
    );
  }
}
