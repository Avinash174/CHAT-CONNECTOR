import 'package:flutter/material.dart';
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
          onPressed: () {},
          child: const Icon(
            Remix.chat_4_line,
          ),
        ),
      ),
    );
  }
}
