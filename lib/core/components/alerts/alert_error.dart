import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../resources/colors.dart';
import '../../resources/shadows.dart';
import '../../widgets/touchable_opacity_widget.dart';

alertError(
  BuildContext context,
  Function? callBack, {
  required String title,
  required String message,
  String? buttonText,
}) {
  showDialog(
    barrierColor: Colors.white.withOpacity(0.01),
    barrierDismissible: true,
    useSafeArea: false,
    context: context,
    builder: (BuildContext context) {
      return Material(
        color: Colors.black26,
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 5,
                  sigmaY: 5,
                ),
                child: const SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
              Align(
                alignment: Alignment(0, -0.2),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(
                      horizontal: 30.w,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(6),
                      ),
                      boxShadow: BaseShadows.primary,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: EdgeInsets.all(
                              24.w,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 24.w,
                                      height: 24.w,
                                      child: Icon(
                                        Icons.warning_rounded,
                                        color: BaseColors.neutral90,
                                        size: 18.w,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Expanded(
                                      child: Text(
                                        title,
                                        style: GoogleFonts.plusJakartaSans(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 8.w,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 24.w,
                                      height: 24.w,
                                    ),
                                    SizedBox(
                                      width: 13.w,
                                    ),
                                    Expanded(
                                      child: Text(
                                        message,
                                        style: GoogleFonts.plusJakartaSans(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          color: BaseColors.neutral80,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 24.w,
                              vertical: 12.w,
                            ),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: BaseColors.neutral20,
                            ),
                            child: Row(
                              children: [
                                const Spacer(),
                                TouchableOpacityWidget(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 50.w,
                                      vertical: 15.w,
                                    ),
                                    decoration: BoxDecoration(
                                      color: BaseColors.danger,
                                      borderRadius: BorderRadius.circular(6),
                                      boxShadow: BaseShadows.primary,
                                    ),
                                    child: Text(
                                      buttonText ?? 'Tutup',
                                      style: GoogleFonts.plusJakartaSans(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  ).whenComplete(() => callBack != null ? callBack() : null);
}
