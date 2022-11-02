



import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild({
    Key? key,
    required double width,
    required this.onChange,
    required this.suffixWidget,
    required this.obsecure,
    required this.labelText,
  }) : _width = width, super(key: key);

  final double _width;
  final Function(String p1) onChange;
  final Widget suffixWidget;
  final bool obsecure;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: _width*0.1,right: _width*0.08),
        child: TextFormField(
          obscureText: obsecure,
          textAlignVertical: TextAlignVertical.bottom,
          onChanged: onChange,
          style: const TextStyle(
            fontSize: 17,
            letterSpacing: 0.5,
            fontWeight: FontWeight.w300,
          ),
          decoration:  InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.indigo)
            ),
            label: Text(labelText,style: TextStyle(
              color: Colors.black38
            ),),
            suffixIcon: suffixWidget,
            contentPadding:
            const EdgeInsets.fromLTRB(
                5, 10, 10, 10),
            hintText: "",
            hintStyle: TextStyle(
                color: Colors.black54,
                letterSpacing: 0.5,
                fontSize: 15),
          ),
        ));
  }
}