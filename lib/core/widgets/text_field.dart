import 'package:amanmemilih_mobile_app/core/constants/colors.dart';
import 'package:amanmemilih_mobile_app/core/widgets/touchable_opacity_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AMTextField extends StatelessWidget {
  const AMTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.isPassword,
    this.validator,
    this.obsecureText = false,
    this.onPasswordHiddenTap,
  });

  final TextEditingController controller;
  final String hint;
  final bool isPassword;
  final bool obsecureText;
  final VoidCallback? onPasswordHiddenTap;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      keyboardType:
          isPassword ? TextInputType.name : TextInputType.visiblePassword,
      obscureText: obsecureText,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: const EdgeInsets.fromLTRB(20, 16, 0, 16),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: colorPrimary,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: fieldDisable,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Color(0xffCFCFCF)),
        ),
        hintStyle: GoogleFonts.plusJakartaSans(
          fontWeight: FontWeight.w200,
          color: const Color(0xffABABAB),
        ),
        suffixIconConstraints: const BoxConstraints(
          minHeight: 25,
          minWidth: 25,
        ),
        suffixIcon: isPassword
            ? TouchableOpacityWidget(
                onTap: onPasswordHiddenTap ?? () {},
                child: Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: SvgPicture.asset(
                    "assets/svg/${obsecureText ? 'eye.svg' : 'eye_close.svg'}",
                    alignment: Alignment.centerLeft,
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
