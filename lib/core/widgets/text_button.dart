import 'package:amanmemilih_mobile_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class AMTextButton extends StatelessWidget {
  const AMTextButton({
    super.key,
    required this.onTap,
    required this.title,
  });

  final Function() onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: const ButtonStyle(
        alignment: Alignment.center,
        minimumSize: WidgetStatePropertyAll(Size(double.infinity, 30)),
        foregroundColor: WidgetStatePropertyAll(colorPrimary),
        overlayColor: WidgetStatePropertyAll(Colors.white),
      ),
      onPressed: onTap,
      child: Text(title),
    );
  }
}
