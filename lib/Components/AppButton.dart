import 'package:flutter/material.dart';
import 'package:trytulu/AppColors.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Function? onTap;
  const AppButton({
    Key? key,
    required this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onTap?.call(),
      child: Text(text),
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 18, vertical: 12)),
        backgroundColor: MaterialStateProperty.all(AppColors.main),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
      ),
    );
  }
}
