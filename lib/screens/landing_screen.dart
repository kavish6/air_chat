import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:air_chat/custom_widgets/custom_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final Stream<QuerySnapshot> usersStream =
      FirebaseFirestore.instance.collection('passengers').snapshots();
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var height = media.height;
    var width = media.width;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
                (width * .05), (height * .1), (width * .01), (height * .01)),
            child: Text(
              'Co-passengers in your vicinity',
              style: TextStyle(
                  fontSize: (height * .03), fontWeight: FontWeight.bold),
            ),
          ),
          StreamBuilder(
              stream: usersStream,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) return Text('Something went wrong');
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }
                return Expanded(
                    child: ListView(
                  padding: EdgeInsets.zero,
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    return CustomCard(
                        width: width,
                        height: height,
                        name: data['name'],
                        id: document.id,
                        desig: data['desig'],
                        comp: data['comp'],
                        status: data['status']);
                  }).toList(),
                ));
              }),
        ],
      ),
    );
  }
}
