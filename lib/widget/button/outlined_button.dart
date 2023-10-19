import 'package:flutter/material.dart';

class PeddlerOutLinedButton extends StatelessWidget {
  final double width;
  final double height;
  final String buttonText;
  final bool isActive;
  final void Function() onTap;

  const PeddlerOutLinedButton({
    super.key,
    required this.buttonText,
    required this.onTap,
    this.isActive = false,
    this.width = 70,
    this.height = 30,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: _buildButtonDecoration(),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: _getTextButtonColor(),
            ),
          ),
        ),
      ),
    );
  }

  Color _getTextButtonColor() {
    if (isActive) return Colors.white;
    return Colors.black;
  }

  BoxDecoration _buildButtonDecoration() => BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color:_getButtonColor(),
        border: Border.all(
          color: Colors.black54,
          width: 1.0,
        ),
      );

  Color _getButtonColor() {
    if (isActive) return Colors.blue;
    return Colors.white;
  }
}
