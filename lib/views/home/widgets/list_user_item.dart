import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListUserItem extends StatefulWidget {
  const ListUserItem(QueryDocumentSnapshot<Object?> doc, {super.key});

  @override
  State<ListUserItem> createState() => _ListUserItemState();
}

class _ListUserItemState extends State<ListUserItem> {
  @override
  Widget build(BuildContext context) {
    return const Text('đây là 1 user');
  }
}
