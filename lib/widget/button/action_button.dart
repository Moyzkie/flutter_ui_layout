import 'package:flutter/material.dart';

class PeddlerIconActionButton extends StatelessWidget {
  final IconData iconData;
  final void Function() onTap;

  const PeddlerIconActionButton(this.iconData, {super.key, required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        iconData,
        color: Colors.pinkAccent,
      ),
    );
  }
}
