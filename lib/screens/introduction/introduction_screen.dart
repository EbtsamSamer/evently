import 'package:easy_localization/easy_localization.dart';
import 'package:evently/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;

import '../../providers/theme_provider.dart';
import 'onboardingScreen.dart';

class IntroductionScreen extends StatelessWidget {
  static const String routeName = "intro";

  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset("assets/images/logo_h.png"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 28.h,
          children: [
            Image.asset("assets/images/intro_l.png", width: double.infinity),
            Text(
              "intro_title".tr(),
              style: GoogleFonts.inter(
                color: Color(0xFF5669FF),
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              "intro_subtitle".tr(),
              style: GoogleFonts.inter(
                color: Color(0xFF1C1C1C),
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "language".tr(),
                    style: GoogleFonts.inter(
                      color: Color(0xFF5669FF),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Directionality(
                  textDirection: ui.TextDirection.ltr,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF5669FF), width: 5.w),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Row(
                      spacing: 16.w,
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.setLocale(Locale('ar'));
                          },

                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xFF5669FF),
                                width: 3.w,
                                style: context.locale.toString() == "ar"
                                    ? BorderStyle.solid
                                    : BorderStyle.none,
                              ),
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Image.asset(
                              "assets/images/EG.png",
                              height: 30.h,
                              width: 35.w,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.setLocale(Locale('en'));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xFF5669FF),
                                width: 3.w,
                                style: context.locale.toString() == "en"
                                    ? BorderStyle.solid
                                    : BorderStyle.none,
                              ),
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Image.asset(
                              "assets/images/USA.png",
                              height: 30.h,
                              width: 35.w,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "theme".tr(),
                    style: GoogleFonts.inter(
                      color: Color(0xFF5669FF),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF5669FF), width: 5.w),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    spacing: 16,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF5669FF),
                            width: 3.w,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            provider.ChangeTheme(ThemeMode.light);
                          },

                          child: Icon(
                            Icons.sunny,
                            size: 30,
                            color: Color(0xFF5669FF),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF5669FF),
                            width: 3.w,
                            style: BorderStyle.none,
                          ),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            provider.ChangeTheme(ThemeMode.dark);
                          },

                          child: Icon(
                            Icons.mode_night_rounded,
                            size: 30,
                            color: Color(0xFF5669FF),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF5669FF),
                  padding: EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, OnboardingScreen.routeName);
                },
                child: Text(
                  "intro_btn".tr(),
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
