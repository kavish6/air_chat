import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:air_chat/utilities/database_helper.dart';
import 'package:air_chat/utilities/chat_id_creater.dart';
import 'package:air_chat/utilities/userinfo.dart';

class TextInput extends StatelessWidget {
  TextInput({required this.textEditingController, required this.id});
  DataBaseHelper dataBaseHelper = DataBaseHelper();
  final String id;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var height = media.height;
    var width = media.width;
    return Column(
      children: [
        Container(
          height: (height * .06),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              chat_bubble(
                message: 'hello',
                id: id,
                dataBaseHelper: dataBaseHelper,
              ),
              chat_bubble(
                message: 'How are you',
                id: id,
                dataBaseHelper: dataBaseHelper,
              ),
              chat_bubble(
                message: 'Thanks for connecting',
                dataBaseHelper: dataBaseHelper,
                id: id,
              ),
              chat_bubble(
                message: 'Would you like to have a business chat',
                dataBaseHelper: dataBaseHelper,
                id: id,
              ),
            ],
          ),
        ),
        Row(
          children: <Widget>[
            // Edit text
            Flexible(
              child: Container(
                height: (height * .08),
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      onSubmitted: (text) {
                        dataBaseHelper.onSendMessage(
                            cid: idCreator(id, UserInfo.userId),
                            sid: UserInfo.userId,
                            message: textEditingController.text);
                        textEditingController.clear();
                        FocusManager.instance.primaryFocus!.unfocus();
                      },
                      keyboardType: TextInputType.text,
                      autofocus: true,
                      maxLines: 5,
                      controller: textEditingController,
                      decoration: const InputDecoration(
                        hintText: 'Tap to type',
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 12, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class chat_bubble extends StatelessWidget {
  const chat_bubble(
      {required this.message, required this.id, required this.dataBaseHelper});
  final String message;
  final String id;
  final DataBaseHelper dataBaseHelper;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var height = media.height;
    var width = media.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: (width * .005)),
      margin: EdgeInsets.symmetric(vertical: 5),
      child: GestureDetector(
        onTap: () {
          dataBaseHelper.onSendMessage(
              cid: idCreator(id, UserInfo.userId),
              sid: UserInfo.userId,
              message: message);
          FocusManager.instance.primaryFocus!.unfocus();
        },
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
          child: Text(message, style: TextStyle(color: Colors.orange)),
        ),
      ),
    );
  }
}
