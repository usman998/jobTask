import 'package:flutter/material.dart';

class Custom_Checkbox extends StatefulWidget {
  double? size;
  double? iconSize;
  Function onChange;
  Color? backgroundColor;
  Color? iconColor;
  Color? borderColor;
  IconData? icon;
  bool isChecked;

  Custom_Checkbox({
    Key? key,
    this.size,
    this.iconSize,
    required this.onChange,
    this.backgroundColor,
    this.iconColor,
    this.icon,
    this.borderColor,
    required this.isChecked,
  }) : super(key: key);

  @override
  State<Custom_Checkbox> createState() => _Custom_CheckboxState();
}

class _Custom_CheckboxState extends State<Custom_Checkbox> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    isChecked = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        widget.onChange();
      },
      child: Container(
        height: widget.size,
          width: widget.size,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.0),
              color: widget.isChecked
                  ? widget.backgroundColor ?? Colors.blue
                  : Colors.transparent,
              border: Border.all(color: widget.borderColor ?? Colors.black)),
          alignment: Alignment.topCenter,
          child: widget.isChecked
              ? Center(
                child: Icon(
            widget.icon ?? Icons.check,
            color: widget.iconColor ?? Colors.white,
            size: widget.iconSize ?? 20,
          ),
              )
              : null),
    );
  }
}