import 'package:amanmemilih_mobile_app/core/widgets/elevated_button.dart';
import 'package:amanmemilih_mobile_app/core/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPasswordScreen extends StatelessWidget {
  const RegisterPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: SvgPicture.asset(
          "assets/svg/logo.svg",
          width: 159.w,
          height: 13.h,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Selamat Datang",
              textAlign: TextAlign.end,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 8.h),
            const Text(
              "Tambahkan password agar anda bisa mengakses fitur pada AmanMemilih",
            ),
            SizedBox(height: 12.h),
            AMTextField(
              controller: TextEditingController(text: ""),
              hint: "Password",
              isPassword: true,
            ),
            SizedBox(height: 8.h),
            AMTextField(
              controller: TextEditingController(text: ""),
              hint: "Konfirmasi Password",
              isPassword: true,
            ),
            SizedBox(height: 16.h),
            AMElevatedButton(
              title: "Lanjut",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
