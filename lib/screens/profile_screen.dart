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
            ),
            SizedBox(
              height: mq.height * 0.04,
            ),
            TextFormField(
              initialValue: widget.user.name,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(
                  Remix.user_line,
                ),
                hintText: 'e.g Jony',
                labelText: 'Name',
              ),
            ),
            SizedBox(
              height: mq.height * 0.03,
            ),
            TextFormField(
              initialValue: widget.user.about,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(
                  Remix.information_line,
                ),
                hintText: 'e.g Happy',
                labelText: 'About',
              ),
            ),
            SizedBox(
              height: mq.height * 0.05,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                minimumSize: Size(
                  mq.width * .5,
                  mq.height * 0.06,
                ),
              ),
              onPressed: () {},
              icon: const Icon(
                Remix.edit_line,
                size: 28,
              ),
              label: const Text(
                'Update',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        child: FloatingActionButton.extended(
          backgroundColor: Colors.redAccent,
          onPressed: () async {
            await APIs.auth.signOut();
            await GoogleSignIn().signOut();
          },
          label: const Text('Logout'),
          icon: const Icon(
            Remix.logout_box_r_fill,
          ),
        ),
      ),
    );
  }
}
