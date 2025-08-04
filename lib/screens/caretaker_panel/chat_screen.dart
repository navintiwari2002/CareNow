import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _CaretakerChatScreenState createState() => _CaretakerChatScreenState();
}

class _CaretakerChatScreenState extends State<ChatScreen> {
  final List<String> messages = [
    "Hi, I need help.",
    "Sure! I’m here.",
  ];

  final TextEditingController messageCtrl = TextEditingController();
  final ScrollController scrollCtrl = ScrollController();

  void sendMessage() {
    final text = messageCtrl.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        messages.add(text);
      });
      messageCtrl.clear();
      scrollCtrl.animateTo(
        scrollCtrl.position.maxScrollExtent + 60,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void dispose() {
    messageCtrl.dispose();
    scrollCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chat with Admin"), backgroundColor: Colors.teal),
      backgroundColor: Colors.teal.shade50,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: scrollCtrl,
              padding: EdgeInsets.all(16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final isMe = index % 2 != 0;
                return Align(
                  alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: ChatBubble(text: messages[index], isMe: isMe),
                );
              },
            ),
          ),
          Divider(height: 1),
          Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageCtrl,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.teal),
                  onPressed: sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isMe;

  const ChatBubble({required this.text, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
      decoration: BoxDecoration(
        color: isMe ? Colors.teal.shade200 : Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 15),
      ),
    );
  }
}
