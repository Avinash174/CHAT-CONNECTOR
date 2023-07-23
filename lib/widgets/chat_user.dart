import 'package:cached_network_image/cached_network_image.dart';
import 'package:connector/main.dart';
import 'package:connector/models/chat_user.dart';
import 'package:connector/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class ChatUserCard extends StatefulWidget {
  final chatUser user;
  const ChatUserCard({super.key, required this.user});

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
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ChatScreen(
                user: widget.user,
              ),
            ),
          );
        },
        child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(
                mq.height * .3,
              ),
              child: CachedNetworkImage(
                width: mq.height * .055,
                height: mq.height * .055,
                fit: BoxFit.fill,
                imageUrl: widget.user.image.toString(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            title: Text(
              widget.user.name,
            ),
            subtitle: Text(
              widget.user.about,
            ),
            trailing: Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                color: Colors.green[500],
                borderRadius: BorderRadius.circular(10.0),
              ),
            )
            // trailing: const Text(
            //   '12:00 PM',
            //   style: TextStyle(
            //     color: Colors.black54,
            //   ),
            // ),
            ),
      ),
    );
  }
}
