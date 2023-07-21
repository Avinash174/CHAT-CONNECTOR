import 'package:connector/apis/apis.dart';
import 'package:connector/main.dart';
import 'package:connector/models/chat_user.dart';
import 'package:connector/screens/profile_screen.dart';
import 'package:connector/widgets/chat_user.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:remixicon/remixicon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<chatUser> list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Connector'),
        leading: const Icon(Remix.home_8_line),
        actions: [
          IconButton(
            icon: const Icon(
              Remix.search_line,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Remix.more_2_fill,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProfileScreen(
                    user: list[0],
                  ),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        child: FloatingActionButton(
          onPressed: () async {
            await APIs.auth.signOut();
            await GoogleSignIn().signOut();
          },
          child: const Icon(
            Remix.chat_4_line,
          ),
        ),
      ),
      body: StreamBuilder(
        stream: APIs.firebaseFirestore.collection('users').snapshots(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.none:
              return const Center(child: CircularProgressIndicator());

            case ConnectionState.active:
            case ConnectionState.done:
              final data = snapshot.data?.docs;

              list =
                  data?.map((e) => chatUser.fromJson(e.data())).toList() ?? [];
              if (list.isNotEmpty) {
                return ListView.builder(
                    padding: EdgeInsets.only(
                      top: mq.height * 0.01,
                    ),
                    physics: const BouncingScrollPhysics(),
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return ChatUserCard(user: list[index]);
                    });
              } else {
                return const Center(
                  child: Text(
                    'No Connection Found',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                );
              }
          }
        },
      ),
    );
  }
}
