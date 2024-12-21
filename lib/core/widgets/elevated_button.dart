import 'package:amanmemilih_mobile_app/core/constants/colors.dart';
import 'package:amanmemilih_mobile_app/core/resources/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AMElevatedButton extends StatelessWidget {
  const AMElevatedButton({
    super.key,
    required this.title,
    required this.onTap,
    this.isLoading = false,
  });

  final String title;
  final bool isLoading;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
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
        backgroundColor: const WidgetStatePropertyAll(colorPrimary),
        foregroundColor: const WidgetStatePropertyAll(colorPrimary),
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
    );
  }
}
