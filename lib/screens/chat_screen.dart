import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:air_chat/custom_widgets/custom_card2.dart';
import 'package:air_chat/custom_widgets/text_input.dart';
import 'package:air_chat/utilities/chat_id_creater.dart';
import 'package:air_chat/utilities/userinfo.dart';
import 'package:air_chat/utilities/build_item.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String id = '';
  String name = '';
  String desig = '';
  String comp = '';
  TextEditingController textEditingController = TextEditingController();
  ScrollController listScrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    var media = MediaQuery.of(context).size;
    var height = media.height;
    var width = media.width;
    id = arg['id'];
    name = arg['name'];
    desig = arg['desig'];
    comp = arg['comp'];
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        padding: EdgeInsets.only(top: (height * .05)),
        child: Column(
          children: [
            ModCard(
                width: width,
                height: height,
                name: name,
                id: id,
                desig: desig,
                comp: comp),
            Flexible(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('chats')
                      .doc(idCreator(id, UserInfo.userId))
                      .collection('messages')
                      .orderBy('time', descending: true)
                      .limit(10)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData) {
                      var listMessage = snapshot.data!.docs;
                      return ListView.builder(
                        padding: const EdgeInsets.all(10.0),
                        itemBuilder: (BuildContext context, int index) =>
                            buildItem(index, snapshot.data!.docs[index]),
                        itemCount: listMessage.length,
                        reverse: true,
                        controller: listScrollController,
                      );
                    } else
                      return Container();
                  }),
            ),
            Container(
              child: TextInput(
                textEditingController: textEditingController,
                id: id,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
