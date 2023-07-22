import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connector/models/chat_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class APIs {
  static FirebaseAuth auth = FirebaseAuth.instance;

  static FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  static FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  static User get user => auth.currentUser!;

  static late chatUser me;

  static Future<bool> userExits() async {
    return (await firebaseFirestore.collection('users').doc(user!.uid).get())
        .exists;
  }

  static Future<void> getSelfInfo() async {
    return (await firebaseFirestore
        .collection('users')
        .doc(user.uid)
        .get()
        .then((user) async {
      if (user.exists) {
        me = chatUser.fromJson(user.data()!);
      } else {
        await createUser().then((value) {
          getSelfInfo();
        });
      }
    }));
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

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllUser() {
    return firebaseFirestore
        .collection('users')
        .where(
          'id',
          isNotEqualTo: user.uid,
        )
        .snapshots();
  }

  static Future<void> updateUserInfo() async {
    return (await firebaseFirestore.collection('users').doc(user.uid).update(
      {'name': me.name, 'about': me.about},
    ));
  }
}
