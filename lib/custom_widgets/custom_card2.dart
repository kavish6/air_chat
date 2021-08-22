import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:air_chat/utilities/obscureid.dart';
import 'package:flutter/material.dart';

class ModCard extends StatelessWidget {
  const ModCard({
    Key? key,
    required this.width,
    required this.height,
    required this.name,
    required this.id,
    required this.desig,
    required this.comp,
  }) : super(key: key);

  final double width;
  final double height;
  final String name;
  final String id;
  final String desig;
  final String comp;

  @override
  Widget build(BuildContext context) {
    return Card(
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
            Row(
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
                            padding:
                                EdgeInsets.symmetric(vertical: (height * .01)),
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
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/');
                FocusManager.instance.primaryFocus!.unfocus();
              },
              child: Icon(
                Icons.close,
                size: (height * .04),
              ),
            )
          ],
        ),
      ),
    );
  }
}
