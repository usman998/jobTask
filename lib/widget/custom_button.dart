


import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.buttonHeight,
    required this.buttonWidth,
    required this.btnColor,
    required this.shadowColor,
    required this.onPress,
    required this.mainWidget,
  }) : super(key: key);

  final double buttonHeight;
  final double buttonWidth;
  final Color btnColor;
  final Color shadowColor;
  final Function()? onPress;
  final Widget mainWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: buttonHeight,
      width: buttonWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        color: btnColor,
        boxShadow: [
          BoxShadow(
            color:shadowColor ,
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 5), // changes position of shadow
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        child: MaterialButton(
          onPressed: onPress,
          child: Container(
            width: double.infinity,
            alignment: Alignment.center,child: mainWidget,
          ),
        ),
      ),
    );
  }
}