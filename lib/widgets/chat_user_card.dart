import 'package:connector/main.dart';
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
      margin: EdgeInsets.symmetric(horizontal: mq.width * .04, vertical: 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 0.7,
      child: InkWell(
        onTap: () {},
        child: const ListTile(
          leading: CircleAvatar(
            child: Icon(
              CupertinoIcons.person_2,
            ),
          ),
          title: Text('Demo User'),
          subtitle: Text(
            'Last Seen User',
            style: TextStyle(
              color: Colors.black54,
            ),
            maxLines: 1,
          ),
          trailing: Text('12:00 AM'),
        ),
      ),
    );
  }
}
