///
/// change_password_screen.dart
/// lib/features/user/presentation/screens
///
/// Created by Indra Mahesa https://github.com/zinct
///

import 'package:amanmemilih_mobile_app/core/constants/colors.dart';
import 'package:amanmemilih_mobile_app/core/widgets/elevated_button.dart';
import 'package:amanmemilih_mobile_app/core/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(35.h),
        child: AppBar(
          backgroundColor: colorPrimary,
          foregroundColor: Colors.white,
          title: Text(
            "Ganti Password",
            style: GoogleFonts.plusJakartaSans(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              AMTextField(
                controller: TextEditingController(),
                hint: "Password Baru",
                isPassword: true,
              ),
              SizedBox(
                height: 16,
              ),
              AMTextField(
                controller: TextEditingController(),
                hint: "Konfirmasi Password Baru",
                isPassword: true,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          child: AMElevatedButton(
            title: "Konfirmasi",
            onTap: () {},
          ),
        ),
      ),
    );
  }
}
