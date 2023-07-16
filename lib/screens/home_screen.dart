import 'package:connector/apis/apis.dart';
import 'package:connector/main.dart';
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
              onPressed: () {},
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
        body: ListView.builder(
          padding: EdgeInsets.only(
            top: mq.height * 0.02,
          ),
          physics: const BouncingScrollPhysics(),
          itemCount: 15,
          itemBuilder: (context, index) {
            return const ChatUserCard();
          },
        ));
  }
}
