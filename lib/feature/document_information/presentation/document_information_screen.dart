import 'package:amanmemilih_mobile_app/core/constants/colors.dart';
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
            SizedBox(height: 12.h),
            _cardInformation(
              "Pemilihan Dewan Perwakilan Rakyat",
              "Terverifikasi",
              "verified",
            ),
            SizedBox(height: 12),
            _cardInformation(
              "Pemilihan Dewan Perwakilan Rakyat",
              "Terverifikasi",
              "unverified",
            ),
            SizedBox(height: 12),
            _cardInformation(
              "Pemilihan Dewan Perwakilan Rakyat",
              "Terverifikasi",
              "verified",
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardInformation(String title, String subtitle, String status) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: Colors.black.withOpacity(0.08),
        ),
      ),
      title: Text(
        title,
        style: GoogleFonts.plusJakartaSans(
          fontWeight: FontWeight.w700,
          fontSize: 12,
          color: const Color(0xff3A3A3A),
        ),
      ),
      subtitle: Text(
        subtitle,
        style: GoogleFonts.plusJakartaSans(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: status == "verified"
              ? status == "unverified"
                  ? colorYellow
                  : colorGreen
              : Colors.black,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios_sharp),
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
