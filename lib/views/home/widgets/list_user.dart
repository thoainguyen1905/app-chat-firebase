import 'package:app_chat_firebase/shared/constants/ColorsConstants.dart';
import 'package:app_chat_firebase/views/chat/chat_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListUsers extends StatefulWidget {
  const ListUsers({super.key});

  @override
  State<ListUsers> createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Widget buildListUser() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }
        return ListView(
          children: snapshot.data!.docs
              .map((document) => _listUserItem(document))
              .toList(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildListUser();
  }

  Widget _listUserItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
    if (_firebaseAuth.currentUser!.email != data['email']) {
      return GestureDetector(
        onTap: () {
          Get.to(const ChatScreen(),
              arguments: {'email': data['email'], 'uid': data['uid']});
        },
        child: Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(top: 10, bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Image.asset('assets/images/robots.png'),
              Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Bobo - Dec 19 .2024',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Roboto-300',
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    data['email'],
                    style: TextStyle(
                        color: ColorsConstants.gray200,
                        fontFamily: 'Roboto-300',
                        fontSize: 15),
                  )
                ],
              )
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
