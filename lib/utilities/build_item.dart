import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:air_chat/utilities/userinfo.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

Widget buildItem(int index, DocumentSnapshot document) {
  if (document['sender'] == UserInfo.userId) {
    // Right (my message)
    return Row(
      children: <Widget>[
        // Text
        Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.orange,
              ),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
            ),
            padding: const EdgeInsets.all(10.0),
            child: Text(document['message'],
                style: TextStyle(color: Colors.orange)),
          ),
        )
      ],
      mainAxisAlignment: MainAxisAlignment.end,
    );
  } else {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: <Widget>[
          Row(children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: [
                  Icon(EvaIcons.personOutline),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: Text(document['message'],
                        style: TextStyle(color: Colors.grey.shade900)),
                  ),
                ],
              ),
            ),
          ])
        ],
        mainAxisAlignment: MainAxisAlignment.start,
      ),
    );
  }
}
