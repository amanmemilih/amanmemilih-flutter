import 'package:amanmemilih_mobile_app/core/widgets/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      appBar: AppBar(
        backgroundColor: const Color(0xffF9F9F9),
        title: Text(
          "Profil",
          style: GoogleFonts.plusJakartaSans(
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x14000000),
                      offset: Offset(0, 8),
                      blurRadius: 55,
                      spreadRadius: 0,
                    ),
                  ]),
              child: ListTile(
                contentPadding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                leading: ClipRRect(
                  child: CircleAvatar(
                    child: SvgPicture.asset("assets/svg/profile.svg"),
                  ),
                ),
                title: Text(
                  "Reinhard Efraim Situmeang",
                  style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: const Color(0xff3A3A3A),
                  ),
                ),
                subtitle: Text(
                  "3182041905980001",
                  style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                    color: const Color(0xff9C9C9C),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.h),
            Text(
              "Akun",
              style: GoogleFonts.plusJakartaSans(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 10.h),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x14000000),
                    offset: Offset(0, 8),
                    blurRadius: 55,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                    leading: SvgPicture.asset("assets/svg/key.svg"),
                    title: const Text("Ubah Password"),
                    trailing: const Icon(Icons.arrow_forward_ios_outlined),
                  ),
                  Divider(
                    color: Colors.black.withOpacity(0.05),
                    endIndent: 18,
                    indent: 18,
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                    leading: SvgPicture.asset(
                      "assets/svg/profile.svg",
                      color: Colors.black,
                    ),
                    title: const Text("Ubah Foto Profil"),
                    trailing: const Icon(Icons.arrow_forward_ios_outlined),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.h),
            AMElevatedButton(
              title: "Logout",
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
