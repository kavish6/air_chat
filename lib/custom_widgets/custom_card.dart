import 'package:air_chat/utilities/userinfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:air_chat/utilities/obscureid.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {Key? key,
      required this.width,
      required this.height,
      required this.name,
      required this.id,
      required this.desig,
      required this.comp,
      required this.status});
  final String name;
  final String id;
  final String desig;
  final String comp;
  final String status;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: (width * .03), vertical: (height * .005)),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0)),
        ),
        elevation: 2.0,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: (width * .02), vertical: (height * .02)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  if (status == '3') {
                    Navigator.pushNamed(context, '/Chat', arguments: {
                      'name': name,
                      'id': id,
                      'desig': desig,
                      'comp': comp,
                    });
                  }
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: (height * .01)),
                      child: Icon(EvaIcons.personOutline),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: (width * .02),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            //Todo:can use stack here for fixed position of id
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: (height * .01)),
                                child: Text(
                                  name,
                                  style: TextStyle(
                                      fontSize: (height * .025),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(width: (width * .02)),
                              Text(replaceCharAt(id))
                            ],
                          ),
                          Text(desig),
                          Text(
                            comp,
                            style: TextStyle(color: Colors.black26),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              CheckStatus(status),
            ],
          ),
        ),
      ),
    );
  }

  Column CheckStatus(String status) {
    if (status == '1') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: (height * .01)),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.add,
                size: (height * .04),
              ),
            ),
          ),
          SizedBox(
            height: (height * .01),
          ),
          Text(
            'Tap to connect',
            style: TextStyle(fontSize: (height * .015)),
          ),
        ],
      );
    } else if (status == '2') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: (height * .01)),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.refresh,
                size: (height * .04),
                color: Colors.red,
              ),
            ),
          ),
          SizedBox(
            height: (height * .01),
          ),
          // Expanded(child: SizedBox()),
          Text(
            'undo request',
            style: TextStyle(fontSize: (height * .015)),
          ),
        ],
      );
    } else if (status == '3') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: (height * .01)),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.check,
                size: (height * .04),
                color: Colors.yellow,
              ),
            ),
          ),
          SizedBox(
            height: (height * .01),
          ),
          // Expanded(child: SizedBox()),
          Text(
            'connected',
            style: TextStyle(fontSize: (height * .015)),
          ),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: (height * .01)),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    EvaIcons.personDeleteOutline,
                    size: (height * .04),
                    color: Colors.red,
                  ),
                ),
                SizedBox(width: (width) * .04),
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    EvaIcons.personAddOutline,
                    size: (height * .04),
                    color: Colors.yellow,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: (height * .01),
          ),
          // Expanded(child: SizedBox()),
          Text(
            '$name has requested to connect',
            style: TextStyle(fontSize: (height * .014)),
          ),
        ],
      );
    }
  }
}
