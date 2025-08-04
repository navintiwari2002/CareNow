import 'package:flutter/material.dart';

class SupportScreen extends StatelessWidget {
  final List<Map<String, dynamic>> messages = [
    {"fromUser": true, "text": "Hi, I need help with my booking."},
    {"fromUser": false, "text": "Sure! What issue are you facing?"},
  ];

  final TextEditingController msgCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Support Chat")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(12),
              itemCount: messages.length,
              itemBuilder: (ctx, index) {
                final msg = messages[index];
                return Align(
                  alignment: msg['fromUser'] ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 4),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: msg['fromUser'] ? Colors.teal[100] : Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(msg['text']),
                  ),
                );
              },
            ),
          ),
          Divider(height: 1),
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: msgCtrl,
                    decoration: InputDecoration(hintText: "Type a message..."),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    // TODO: handle sending message
                    msgCtrl.clear();
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
