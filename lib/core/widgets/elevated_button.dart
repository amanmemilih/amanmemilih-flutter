import 'package:amanmemilih_mobile_app/core/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AMElevatedButton extends StatelessWidget {
  const AMElevatedButton({
    super.key,
    required this.title,
    required this.onTap,
    this.isLoading = false,
    this.backgroundColor = colorPrimary,
    this.foregroundColor = colorPrimary,
  });

  final String title;
  final bool isLoading;
  final Color backgroundColor;
  final Color foregroundColor;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      identifier: "button_${title.replaceAll(" ", "_").toLowerCase()}",
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          minimumSize: const WidgetStatePropertyAll(
            Size(double.infinity, 52),
          ),
          elevation: const WidgetStatePropertyAll(0),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          backgroundColor: WidgetStatePropertyAll(backgroundColor),
          foregroundColor: WidgetStatePropertyAll(foregroundColor),
          overlayColor: WidgetStatePropertyAll(buttonPressed),
        ),
        child: isLoading
            ? Center(
                child: SizedBox(
                  height: 50.w,
                  width: 50.w,
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              )
            : Text(
                title,
                style: GoogleFonts.plusJakartaSans(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
      ),
    );
  }
}
