import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/theme/theming.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:evently/providers/user_provider.dart';
import 'package:evently/screens/event/edit_event.dart';
import 'package:evently/screens/event/event_details.dart';
import 'package:evently/screens/home/create_event.dart';
import 'package:evently/screens/home/home_screen.dart';
import 'package:evently/screens/introduction/introduction_screen.dart';
import 'package:evently/screens/introduction/onboardingScreen.dart';
import 'package:evently/screens/login/login_screen.dart';
import 'package:evently/screens/login/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await FirebaseFirestore.instance.disableNetwork();
  await FirebaseFirestore.instance.enableNetwork();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
        child: MultiProvider(
            providers: [
    ChangeNotifierProvider(create: (context) => ThemeProvider(),),
      ChangeNotifierProvider(create: (context) => UserProvider(),)

            ],
            child: MyApp()),
      ),

  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);
    return ScreenUtilInit(
      designSize: const Size(393, 817),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        theme: AppTheming.lighttheme,
        darkTheme: AppTheming.darktheme,
        themeMode: provider.themeMode,

        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
        initialRoute:HomeScreen.routeName,
        //userProvider.firebaseUser!=null? HomeScreen.routeName:IntroductionScreen.routeName,
        routes: {
          IntroductionScreen.routeName: (_) => IntroductionScreen(),
          OnboardingScreen.routeName:(_)=>OnboardingScreen(),
          HomeScreen.routeName: (_) => HomeScreen(),
          LoginScreen.routeName: (_) => LoginScreen(),
          SignUpScreen.routeName: (_) => SignUpScreen(),
          CreateEvent.routeName:(_)=>CreateEvent(),
          EventDetails.routeName:(c)=>EventDetails(),
          EditEvent.routeName:(c)=>EditEvent(),

        },
      ),
    );
  }
}
