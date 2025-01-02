///
/// change_password_screen.dart
/// lib/features/user/presentation/screens
///
/// Created by Indra Mahesa https://github.com/zinct
///
///
/// Maaf harus menggunakan stateful, karena mason punya indra bermasalah 🙏

import 'package:amanmemilih_mobile_app/core/constants/colors.dart';
import 'package:amanmemilih_mobile_app/core/constants/network.dart';
import 'package:amanmemilih_mobile_app/core/widgets/elevated_button.dart';
import 'package:amanmemilih_mobile_app/core/widgets/text_field.dart';
import 'package:amanmemilih_mobile_app/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> changePassword() async {
    try {
      final dio = Dio();
      AuthLocalDataSource authLocalDataSource = HiveAuthLocalDataSource();

      dio.options.headers['Authorization'] =
          'Bearer ${await authLocalDataSource.getToken()}';
      final response = await dio.post(
        "${NETWORK.baseURL}/change-password",
        data: {
          "password": passwordController.text,
          "password_confirmation": confirmPasswordController.text,
        },
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Password berhasil diubah"),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Password gagal diubah"),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (error) {
      throw Exception(error);
    }
  }

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
                controller: passwordController,
                hint: "Password Baru",
                isPassword: true,
              ),
              const SizedBox(
                height: 16,
              ),
              AMTextField(
                controller: confirmPasswordController,
                hint: "Konfirmasi Password Baru",
                isPassword: true,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: AMElevatedButton(
          title: "Konfirmasi",
          onTap: changePassword,
        ),
      ),
    );
  }
}
