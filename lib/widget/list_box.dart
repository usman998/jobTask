


import 'package:flutter/material.dart';

class ListBox extends StatelessWidget {
  const ListBox({
    Key? key,
    required double height,
    required this.index,
    required this.name,
    required this.email,
    required this.avatarName,
  }) : _height = height, super(key: key);

  final double _height;
  final int index;
  final String name;
  final String email;
  final String avatarName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          color: Colors.white,
        ),
        height: _height*0.15,
        child: Row(
          children: [
            Expanded(
                flex: 5,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(avatarName),
                          fit: BoxFit.cover
                      )
                  ),
                )),
            Expanded(
                flex: 6,
                child: Container(
                  padding: EdgeInsets.only(left: 10,top: 20),
                  alignment: Alignment.topLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        name,
                      ),
                      SizedBox(height: 10,),
                      Text(
                        email,
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}