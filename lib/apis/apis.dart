import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connector/models/chat_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class APIs {
  static FirebaseAuth auth = FirebaseAuth.instance;

  static FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  static User get user => auth.currentUser!;

  static Future<bool> userExits() async {
    return (await firebaseFirestore.collection('users').doc(user!.uid).get())
        .exists;
  }

  static Future<void> createUser() async {
    final time = DateTime.now().microsecondsSinceEpoch.toString();
    final ChatUser = chatUser(
        image: user.photoURL.toString(),
        name: user.displayName.toString(),
        about: '',
        createdAt: time,
        isOnline: false,
        id: user.uid,
        lastActive: time,
        email: user.email.toString(),
        pushToken: '');
    return (await firebaseFirestore.collection('users').doc(user.uid).set(
          ChatUser.toJson(),
        ));
  }
}
