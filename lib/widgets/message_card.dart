import 'package:connector/apis/apis.dart';
import 'package:connector/main.dart';
import 'package:connector/models/message.dart';
import 'package:flutter/material.dart';

class MessageCard extends StatefulWidget {
  final Message message;
  const MessageCard({super.key, required this.message});

  @override
  State<MessageCard> createState() => _MessageCardState();
}

class _MessageCardState extends State<MessageCard> {
  @override
  Widget build(BuildContext context) {
    return APIs.user.uid == widget.message.fromId ? greenMsg() : blueMsg();
  }

  Widget blueMsg() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(
            right: mq.width * .04,
          ),
          child: Text(
            widget.message.sent,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black54,
            ),
          ),
        ),
        Flexible(
          child: Container(
            padding: EdgeInsets.all(
              mq.width * .04,
            ),
            margin: EdgeInsets.symmetric(
                horizontal: mq.width * .04, vertical: mq.height * .01),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 221, 245, 255),
              border: Border.all(
                color: Colors.lightBlue,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(
                  30,
                ),
                topRight: Radius.circular(
                  30,
                ),
                bottomLeft: Radius.circular(
                  30,
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: mq.width * .04,
              ),
              child: Text(
                widget.message.sent,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget greenMsg() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Container(
            padding: EdgeInsets.all(
              mq.width * .04,
            ),
            margin: EdgeInsets.symmetric(
                horizontal: mq.width * .04, vertical: mq.height * .01),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 218, 255, 176),
              border: Border.all(
                color: Colors.lightGreen,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(
                  30,
                ),
                topRight: Radius.circular(
                  30,
                ),
                bottomLeft: Radius.circular(
                  30,
                ),
              ),
            ),
            child: Text(
              widget.message.msg,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black87,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: mq.width * .04,
          ),
          child: Text(
            widget.message.sent,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black54,
            ),
          ),
        ),
      ],
    );
    ;
  }
}
