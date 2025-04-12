///
/// change_profile_screen.dart
/// lib/features/user/presentation/screens
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

import 'package:amanmemilih_mobile_app/core/constants/colors.dart';
import 'package:amanmemilih_mobile_app/features/auth/presentation/cubits/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangeProfileScreen extends StatelessWidget {
  const ChangeProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(35.h),
        child: AppBar(
          backgroundColor: colorPrimary,
          foregroundColor: Colors.white,
          title: Text(
            "Ubah Profile",
            style: GoogleFonts.plusJakartaSans(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) => Column(
            children: [
              _buildListTile(
                "Nama",
                state.credential?.user?.username ?? '',
              ),
              _buildListTile(
                "Alamat",
                state.credential?.user?.address ?? '',
              ),
              _buildListTile(
                "Provinsi",
                state.credential?.user?.province ?? '',
              ),
              _buildListTile(
                "Kecamatan",
                state.credential?.user?.subdistrict ?? '',
              ),
              _buildListTile(
                "Kabupaten/Kota",
                state.credential?.user?.province ?? '',
              ),
              _buildListTile(
                "Desa",
                state.credential?.user?.village ?? '',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListTile(String title, String content) => ListTile(
        title: Text(
          title,
          style: GoogleFonts.plusJakartaSans(
            color: Colors.grey,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        trailing: Text(
          content,
          style: GoogleFonts.plusJakartaSans(
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
      );
}
