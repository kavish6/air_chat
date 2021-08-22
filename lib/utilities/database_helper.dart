import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseHelper {
  void listener() {
    FirebaseFirestore.instance
        .collection('passengers')
        .snapshots()
        .listen((event) {});
  }

  void onSendMessage(
      {required String cid, required String sid, required String message}) {
    if (message.trim() != '') {
      message = message.trim();
      final CollectionReference chatRoom = FirebaseFirestore.instance
          .collection('chats')
          .doc(cid)
          .collection('messages');
      chatRoom.add({
        'sender': sid,
        'message': message,
        'time': FieldValue.serverTimestamp()
      }).then((value) => print('message added'));
    }
  }
}
