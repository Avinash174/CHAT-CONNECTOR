import 'package:connector/apis/apis.dart';
import 'package:connector/main.dart';
import 'package:connector/models/chat_user.dart';
import 'package:connector/screens/profile_screen.dart';
import 'package:connector/widgets/chat_user_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<chatUser> list = [];
  final List<chatUser> searchList = [];
  bool _isSearching = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    APIs.getSelfInfo();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: WillPopScope(
        onWillPop: () {
          if (_isSearching) {
            setState(() {
              _isSearching = !_isSearching;
            });
            return Future.value(false);
          } else {
            return Future.value(true);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: _isSearching
                ? TextField(
                    decoration: const InputDecoration(
                      hintText: 'Name,Email,....',
                    ),
                    autofocus: true,
                    style: const TextStyle(
                      fontSize: 17,
                      letterSpacing: 0.5,
                    ),
                    onChanged: (val) {
                      searchList.clear();
                      for (var i in list) {
                        if (i.name.toLowerCase().contains(val.toLowerCase()) ||
                            i.email.toLowerCase().contains(val.toLowerCase())) {
                          searchList.add(i);
                        }
                        setState(() {
                          searchList;
                        });
                      }
                    },
                  )
                : const Text('Chat Connector'),
            leading: const Icon(Remix.home_8_line),
            actions: [
              IconButton(
                icon: Icon(
                  _isSearching
                      ? CupertinoIcons.clear_circled_solid
                      : Remix.search_line,
                ),
                onPressed: () {
                  setState(() {
                    _isSearching = !_isSearching;
                  });
                },
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
                        user: APIs.me,
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
              onPressed: () {},
              child: const Icon(
                Remix.chat_4_line,
              ),
            ),
          ),
          body: StreamBuilder(
            stream: APIs.firebaseFirestore.collection('users').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              final _list = [];
              return ListView.builder(
                itemCount: 16,
                padding: EdgeInsets.only(top: mq.height * .0),
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return const ChatUserCard();
                },
              );
            },
          ),

          //
        ),
      ),
    );
  }
}
