import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:connector/apis/apis.dart';
import 'package:connector/helper/dialog.dart';
import 'package:connector/main.dart';
import 'package:connector/models/chat_user.dart';
import 'package:connector/screens/auth.screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:remixicon/remixicon.dart';

class ProfileScreen extends StatefulWidget {
  final chatUser user;
  const ProfileScreen({super.key, required this.user});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile Screen'),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: mq.width * 0.05,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: mq.width,
                    height: mq.height * .03,
                  ),
                  Stack(
                    children: [
                      _image != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(
                                mq.height * .1,
                              ),
                              child: Image.file(
                                File(
                                  _image!,
                                ),
                                width: mq.height * .2,
                                height: mq.height * .2,
                                fit: BoxFit.cover,
                              ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(
                                mq.height * .1,
                              ),
                              child: CachedNetworkImage(
                                width: mq.height * .2,
                                height: mq.height * .2,
                                fit: BoxFit.cover,
                                imageUrl: widget.user.image.toString(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: MaterialButton(
                          elevation: 1,
                          onPressed: () {
                            showbottomModelSheet();
                          },
                          child: Icon(
                            Remix.edit_line,
                          ),
                          shape: const CircleBorder(),
                          color: Colors.white,
                        ),
                      ),
                    ],
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
                    onSaved: (val) => APIs.me.name = val ?? '',
                    initialValue: widget.user.name,
                    validator: (val) =>
                        val != null && val.isNotEmpty ? null : 'Required Field',
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
                    onSaved: (val) => APIs.me.about = val ?? '',
                    initialValue: widget.user.about,
                    validator: (val) =>
                        val != null && val.isNotEmpty ? null : 'Required Field',
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
                      shape: const StadiumBorder(),
                      minimumSize: Size(
                        mq.width * .5,
                        mq.height * 0.06,
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        APIs.updateUserInfo().then((value) {
                          Dialogs.showSnackBar(
                              context, 'Profile Update Successfully');
                        });
                      }
                    },
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
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          ),
          child: FloatingActionButton.extended(
            backgroundColor: Colors.redAccent,
            onPressed: () async {
              Dialogs.showProgressBar(context);
              await APIs.auth.signOut().then((value) {
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const LoginSCreen(),
                  ),
                );
              });
              await GoogleSignIn().signOut();
            },
            label: const Text('Logout'),
            icon: const Icon(
              Remix.logout_box_r_fill,
            ),
          ),
        ),
      ),
    );
  }

  void showbottomModelSheet() {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              20,
            ),
            topRight: Radius.circular(
              20,
            ),
          ),
        ),
        builder: (_) {
          return ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(
              top: mq.height * .02,
              bottom: mq.height * .10,
            ),
            children: [
              const Text(
                'Pick Image Picture',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: mq.height * .02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        fixedSize: Size(
                          mq.width * .3,
                          mq.height * .13,
                        ),
                        shape: const CircleBorder()),
                    onPressed: () async {
                      final ImagePicker picker = ImagePicker();
                      final XFile? image = await picker.pickImage(
                        source: ImageSource.camera,
                        imageQuality: 80,
                      );
                      if (image != null) {
                        setState(() {
                          _image = image.path;
                        });
                      }
                      APIs.updateProfile(
                        File(_image!),
                      );

                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/images/camera.png',
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        fixedSize: Size(
                          mq.width * .3,
                          mq.height * .13,
                        ),
                        shape: const CircleBorder()),
                    onPressed: () async {
                      final ImagePicker picker = ImagePicker();

                      final XFile? image = await picker.pickImage(
                        source: ImageSource.gallery,
                        imageQuality: 80,
                      );

                      if (image != null) {
                        setState(() {
                          _image = image.path;
                        });
                      }
                      APIs.updateProfile(
                        File(_image!),
                      );

                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/images/add_image.png',
                    ),
                  ),
                ],
              )
            ],
          );
        });
  }
}
