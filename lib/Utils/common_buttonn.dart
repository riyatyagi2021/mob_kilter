import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String? title;
  final Color color;
  final void Function() onPressed;

  const CommonButton(
      {Key? key,
        required this.title,
        required this.color,
        required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(title!),
      style: ElevatedButton.styleFrom(
          primary: color,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
    );
  }
}
