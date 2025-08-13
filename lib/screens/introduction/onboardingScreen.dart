import 'package:evently/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../home/home_screen.dart';

class OnboardingScreen extends StatelessWidget {
  static const String routeName = "OnboardingScreen";

  const OnboardingScreen({super.key});

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/images/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    TextStyle bodyStyle = GoogleFonts.inter(
      fontSize: 16.0,
      color: Color(0xFF1C1C1C),
      fontWeight: FontWeight.w500,
    );

    var pageDecoration = PageDecoration(
      titleTextStyle: GoogleFonts.inter(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: Color(0xFF5669FF),
      ),
      bodyTextStyle: bodyStyle,
      pageColor: Colors.white,
      imageFlex: 2,
    );
    return IntroductionScreen(
      globalHeader: Image.asset("assets/images/logo_h.png"),
      dotsDecorator: DotsDecorator(
        color: Colors.black,
        activeColor: Colors.blue,
      ),
      globalBackgroundColor: Colors.white,
      showBackButton: true,
      back: Icon(Icons.arrow_back, color: Color(0xFF5669FF), size: 35),
      showDoneButton: true,

      done: Icon(Icons.arrow_forward, color: Color(0xFF5669FF), size: 35),
      onDone: () {
        Navigator.pushReplacementNamed(context, LoginScreen.routeName);
      },
      showNextButton: true,
      next: Icon(Icons.arrow_forward, color: Color(0xFF5669FF), size: 35),
      pages: [
        PageViewModel(
          title: "Find Events That Inspire You",
          body:
              "Dive into a world of events crafted to fit your unique interests."
              " Whether you're into live music, art workshops, professional networking,"
              " or simply discovering new experiences, we have something for everyone. "
              "Our curated recommendations will help you explore, connect, and make the "
              "most of every opportunity around you.",
          image: _buildImage('onboarding1.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Effortless Event Planning",
          body:
              "Take the hassle out of organizing events with our all-in-one planning tools."
              " From setting up invites and managing RSVPs to scheduling reminders and"
              " coordinating details, we’ve got you covered. Plan with ease and focus on "
              "what matters – creating an unforgettable experience for you and your guests.",
          image: _buildImage('onboarding2.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Connect with Friends & Share Moments",
          body:
              "Make every event memorable by sharing the experience with others. Our platform"
              " lets you invite friends, keep everyone in the loop, and celebrate moments"
              " together. Capture and share the excitement with your network, so you can"
              " relive the highlights and cherish the memories.",
          image: _buildImage('onboarding3.png'),
          decoration: pageDecoration,
        ),
      ],
    );
  }
}
