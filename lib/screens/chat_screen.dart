import 'package:flash_chat_app/constants.dart';
import 'package:flash_chat_app/widgets/chat_message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;

class ChatScreen extends StatefulWidget {
  static const String id = 'ChatScreen';
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');

  var _controller = TextEditingController();

  String message = '';

  Future<void> addMessage() {
    return messages
        .add({
          'sender': FirebaseAuth.instance.currentUser?.email,
          'text': message
        })
        .then((value) => print("Message Added"))
        .catchError((error) => print("Failed to add User: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: Icon(Icons.close))
        ],
        title: Text('⚡Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ChatBubble(),
              Container(
                  decoration: KMessageContainerDecoration,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          onChanged: ((value) {
                            message = value;
                          }),
                          decoration: KMessageTextFieldDecoration,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _controller.clear();
                          addMessage();
                        },
                        child: Text('Send',
                            style: TextStyle(
                              color: Colors.white,
                            )),
                      ),
                    ],
                  )),
            ]),
      ),
    );
  }
}
