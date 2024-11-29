import 'package:amanmemilih_mobile_app/core/constants/colors.dart';
import 'package:amanmemilih_mobile_app/core/constants/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DocumentInformationScreen extends StatelessWidget {
  const DocumentInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(35.h),
        child: AppBar(
          backgroundColor: colorPrimary,
          foregroundColor: Colors.white,
          title: Text(
            "Informasi Dokumen",
            style: GoogleFonts.plusJakartaSans(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(24),
        child: Column(
          children: [
            _filterButtons(),
            SizedBox(height: 5.h),
            _cardInformation(
              title: "Pemilihan Dewan Perwakilan Rakyat",
              subtitle: "Terverifikasi",
              status: "verified",
              onTap: () => Navigator.pushNamed(
                context,
                ROUTER.detailForm,
              ),
            ),
            _cardInformation(
              title: "Pemilihan Dewan Perwakilan Rakyat",
              subtitle: "Terunggah",
              status: "unverified",
              onTap: () => Navigator.pushNamed(
                context,
                ROUTER.detailForm,
              ),
            ),
            _cardInformation(
              status: "unuploaded",
              subtitle: "Belum diunggah",
              title: "Pemilihan Dewan Perwakilan",
              onTap: () => Navigator.pushNamed(
                context,
                ROUTER.detailForm,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardInformation({
    String? title,
    String? subtitle,
    String status = "unuploaded",
    Function()? onTap,
  }) {
    return Container(
      margin: EdgeInsets.only(top: 5.h),
      child: ListTile(
        onTap: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: Colors.black.withOpacity(0.08),
          ),
        ),
        title: Text(
          title ?? "Error",
          style: GoogleFonts.plusJakartaSans(
            fontWeight: FontWeight.w700,
            fontSize: 12,
            color: const Color(0xff3A3A3A),
          ),
        ),
        subtitle: Text(
          subtitle ?? "Error",
          style: GoogleFonts.plusJakartaSans(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: status == "verified"
                ? colorGreen
                : (status == "unverified" ? colorYellow : Colors.black),
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios_sharp),
      ),
    );
  }

  Widget _filterButtons() {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Chip(
            backgroundColor: const Color(0xffFFE5E5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            side: const BorderSide(
              color: colorPrimary,
            ),
            label: Text(
              "Semua",
              style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.w700,
                fontSize: 12,
                color: colorPrimary,
              ),
            ),
          ),
          Chip(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            side: const BorderSide(
              color: Color(0xffBDBDBD),
            ),
            label: Text(
              "Belum Unggah",
              style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.w700,
                fontSize: 12,
                color: const Color(0xffBDBDBD),
              ),
            ),
          ),
          Chip(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            side: const BorderSide(
              color: Color(0xffBDBDBD),
            ),
            label: Text(
              "Terverifikasi",
              style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.w700,
                fontSize: 12,
                color: const Color(0xffBDBDBD),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
