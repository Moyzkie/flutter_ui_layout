import 'package:flutter/material.dart';

class PeddlerBackButton extends StatelessWidget {
  final void Function() onPressed;
  const PeddlerBackButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
    );
  }
}
