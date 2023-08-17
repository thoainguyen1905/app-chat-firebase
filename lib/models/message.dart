import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderId;
  final String receiverId;
  final String senderEmail;
  final String message;
  final Timestamp timestamp;
  Message({
    required this.message,
    required this.senderId,
    required this.receiverId,
    required this.senderEmail,
    required this.timestamp,
  });
  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'message': message,
      'receiverId': receiverId,
      'senderEmail': senderEmail,
      'timestamp': timestamp,
    };
  }
}
