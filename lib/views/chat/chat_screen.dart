import 'package:app_chat_firebase/services/chat_services.dart';
import 'package:app_chat_firebase/shared/constants/ColorsConstants.dart';
import 'package:app_chat_firebase/shared/helpers/logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final params = Get.arguments;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final ChatServices _chatServices = ChatServices();
  final TextEditingController _messageController = TextEditingController();
  Future<void> sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatServices.sendMessages(params['uid'], _messageController.text);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  child: const Icon(Icons.arrow_back),
                  onTap: () {
                    Get.toNamed('/home');
                  },
                ),
                Expanded(
                    child: Center(
                  child: Text(
                    params['email'].toString(),
                    style: TextStyle(
                        fontSize: 16,
                        color: ColorsConstants.gray200,
                        fontFamily: 'Roboto-300'),
                  ),
                ))
              ],
            ),
            Expanded(
              child: _buildMessageList(),
            ),
            _buildChatInput(), // Chat input field
          ],
        ),
      ),
    );
  }

  Widget _buildMessageList() {
    return StreamBuilder(
        stream: _chatServices.getMessages(
            params['uid'], _firebaseAuth.currentUser!.uid),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            logger.w('Đã có lỗi xảy ra');
            return const Text('Đã có lỗi xảy ra');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('loading');
          }
          return ListView(
            children: snapshot.data!.docs
                .map((document) => _buildChatBubble(document))
                .toList(),
          );
        });
  }

  Widget _buildChatBubble(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    var alignment = (data['senderId'] == _firebaseAuth.currentUser!.uid);

    return Container(
      alignment: alignment ? Alignment.centerRight : Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: alignment ? ColorsConstants.light200 : ColorsConstants.gray200,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          (data['message']),
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }

  Widget _buildChatInput() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'Enter your message...',
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                        BorderSide(color: ColorsConstants.gray100, width: 2)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                        BorderSide(color: ColorsConstants.light200, width: 2)),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: ColorsConstants.light200,
              borderRadius: BorderRadius.circular(30),
            ),
            child: IconButton(
              icon: const Icon(Icons.send),
              color: Colors.white,
              onPressed: () {
                // Handle sending the message
                sendMessage();
              },
            ),
          )
        ],
      ),
    );
  }
}
