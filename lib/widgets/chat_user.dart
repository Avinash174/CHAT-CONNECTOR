import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatUserCard extends StatefulWidget {
  const ChatUserCard({super.key});

  @override
  State<ChatUserCard> createState() => _ChatUserCardState();
}

class _ChatUserCardState extends State<ChatUserCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(
        5.0,
      ),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          15.0,
        ),
      ),
      child: InkWell(
        onTap: () {},
        child: const ListTile(
          leading: CircleAvatar(
            child: Icon(
              CupertinoIcons.person,
            ),
          ),
          title: Text('User'),
          subtitle: Text(
            'Last User Msg',
            maxLines: 1,
          ),
          trailing: Text(
            '12:00 PM',
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
        ),
      ),
    );
  }
}
