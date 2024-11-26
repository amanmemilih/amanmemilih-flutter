import 'package:amanmemilih_mobile_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      child: Text(
        title,
        style: GoogleFonts.plusJakartaSans(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: colorPrimary,
        ),
      ),
    );
  }
}
