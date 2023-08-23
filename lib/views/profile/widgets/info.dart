import 'package:app_chat_firebase/controllers/UserController.dart';
import 'package:app_chat_firebase/services/auth_firebase.dart';
import 'package:app_chat_firebase/shared/constants/ColorsConstants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoWidget extends StatefulWidget {
  const InfoWidget({super.key});

  @override
  State<InfoWidget> createState() => _InfoWidgetState();
}

class _InfoWidgetState extends State<InfoWidget> {
  final FirebaseServices _firebaseServices = FirebaseServices();
  final userController = Get.put(UserController());
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
            const Expanded(
                child: Center(
              child: Text(
                'Your Profile',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Roboto-300'),
              ),
            ))
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Stack(
          children: [
            const CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdqPl43OwkBWK01LjUks2q8qmS43UzW_TpFw&usqp=CAU'),
            ),
            Positioned(
              bottom: 5,
              right: 10,
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorsConstants.light200),
                child: const Icon(Icons.edit, color: Colors.white),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        TextField(
          onChanged: (value) {
            userController.updateName(value);
          },
          controller: TextEditingController(text: userController.name.value),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Name',
            hintStyle: const TextStyle(
              fontFamily: 'Roboto-300',
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide:
                    BorderSide(color: ColorsConstants.gray300, width: 2)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide:
                    BorderSide(color: ColorsConstants.light200, width: 2)),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextField(
          onChanged: (value) {
            userController.updateEmail(value);
          },
          controller: TextEditingController(text: userController.email.value),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Email',
            hintStyle: const TextStyle(
              fontFamily: 'Roboto-300',
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide:
                    BorderSide(color: ColorsConstants.gray300, width: 2)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide:
                    BorderSide(color: ColorsConstants.light200, width: 2)),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextField(
          onChanged: (value) {
            userController.updatePhone(value);
          },
          controller: TextEditingController(
              text: userController.phone.value.toString()),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Phone',
            hintStyle: const TextStyle(
              fontFamily: 'Roboto-300',
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide:
                    BorderSide(color: ColorsConstants.gray300, width: 2)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide:
                    BorderSide(color: ColorsConstants.light200, width: 2)),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            _firebaseServices.updateInforUser();
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: ColorsConstants.light200),
            child: const Align(
              alignment: Alignment.center,
              child: Text(
                'Continue',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: "Robot-300",
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        )
      ],
    );
  }
}
