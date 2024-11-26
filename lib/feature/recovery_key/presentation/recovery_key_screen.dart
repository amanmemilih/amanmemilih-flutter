import 'package:amanmemilih_mobile_app/core/constants/colors.dart';
import 'package:amanmemilih_mobile_app/core/widgets/elevated_button.dart';
import 'package:amanmemilih_mobile_app/core/widgets/text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class RecoveryKeyScreen extends StatelessWidget {
  const RecoveryKeyScreen({super.key});

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Atur kode recovery",
              textAlign: TextAlign.end,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 8.h),
            const Text(
              "Simpan kode ini ditempat yang aman, dan hanya anda yang bisa mengaksesnya.",
            ),
            SizedBox(height: 16.h),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  GridView.count(
                    scrollDirection: Axis.vertical,
                    crossAxisCount: 2,
                    childAspectRatio: 3.8,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 24,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    children: List.generate(
                      10,
                      (index) => Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 386.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: colorPrimary),
                        ),
                        child: const Text("data"),
                      ),
                    ),
                  ),
                  AMTextButton(onTap: () {}, title: "Sembunyikan Kode")
                ],
              ),
            ),
            AMElevatedButton(title: "Simpan", onTap: () {}),
            const SizedBox(height: 21)
          ],
        ),
      ),
    );
  }
}
