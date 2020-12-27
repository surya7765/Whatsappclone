import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:whatsapp/chatscreen/recent_chats.dart';
import 'package:whatsapp/pages/chat_model.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: DummyData.length,
      itemBuilder: (context, index) => Column(
        children: <Widget>[
          SizedBox(
            height: 5.0,
          ),
          GestureDetector(
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => RecentChat())),
            child: ListTile(
              onLongPress: () => {
                setState(() {
                  DummyData[index].selected = !DummyData[index].selected;
                  log(DummyData[index].selected.toString());
                })
              },
              leading: CircleAvatar(
                foregroundColor: Colors.amber,
                backgroundColor: Colors.grey,
                radius: 30.0,
                backgroundImage: NetworkImage(DummyData[index].avatarUrl),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    DummyData[index].name,
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.grey[300]),
                  ),
                  Text(
                    DummyData[index].time,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0,
                    ),
                  )
                ],
              ),
              subtitle: Container(
                padding: EdgeInsets.only(top: 5.0),
                child: Text(
                  DummyData[index].message,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15.0,
                  ),
                ),
              ),
              trailing: (DummyData[index].selected)
                  ? Icon(
                      Icons.check_box_rounded,
                      color: Theme.of(context).accentColor,
                    )
                  : SizedBox.shrink(),
            ),
          ),
          Divider(
            height: 15.0,
          ),
        ],
      ),
    );
  }
}
