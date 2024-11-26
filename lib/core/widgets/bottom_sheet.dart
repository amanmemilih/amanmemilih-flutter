import 'package:amanmemilih_mobile_app/core/widgets/elevated_button.dart';
import 'package:amanmemilih_mobile_app/core/widgets/outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AMBottomSheet extends StatelessWidget {
  const AMBottomSheet({
    super.key,
    required this.onContinue,
    required this.onCancel,
  });

  final Function() onContinue;
  final Function() onCancel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      margin: const EdgeInsets.fromLTRB(24, 26, 24, 21),
      width: double.infinity,
      child: Column(
        children: [
          Text(
            "Halo, Reinhard",
            style: GoogleFonts.plusJakartaSans(
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Selamat datang di AmanMemilih",
            textAlign: TextAlign.center,
            style: GoogleFonts.plusJakartaSans(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              letterSpacing: 0.36,
            ),
          ),
          Text(
            "sebelum melanjutkan, harap isi password anda terlebih dahulu",
            textAlign: TextAlign.center,
            style: GoogleFonts.plusJakartaSans(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              letterSpacing: 0.36,
            ),
          ),
          const SizedBox(height: 28),
          AMElevatedButton(
            title: "Lanjut",
            onTap: onContinue,
          ),
          const SizedBox(height: 16),
          AMOutlinedButton(
            title: "Batalkan",
            onTap: onCancel,
          )
        ],
      ),
    );
  }
}
