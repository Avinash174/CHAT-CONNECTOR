import 'package:cached_network_image/cached_network_image.dart';
import 'package:connector/apis/apis.dart';
import 'package:connector/main.dart';
import 'package:connector/models/chat_user.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:remixicon/remixicon.dart';

class ProfileScreen extends StatefulWidget {
  final chatUser user;
  const ProfileScreen({super.key, required this.user});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: mq.width * 0.05,
        ),
        child: Column(
          children: [
            SizedBox(
              width: mq.width,
              height: mq.height * .03,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(
                mq.height * .1,
              ),
              child: CachedNetworkImage(
                width: mq.height * .2,
                height: mq.height * .2,
                fit: BoxFit.fill,
                imageUrl: widget.user.image.toString(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            SizedBox(
              // width: mq.width,
              height: mq.height * .03,
            ),
            Text(
              widget.user.email,
              style: const TextStyle(
                fontSize: 20.0,
                color: Colors.black54,
              ),
            )
          ],
        ),
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
    );
  }
}
