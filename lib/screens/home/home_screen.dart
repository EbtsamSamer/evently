import 'package:evently/screens/home/create_event.dart';
import 'package:evently/screens/home/tabs/event_tab.dart';
import 'package:evently/screens/home/tabs/fav_tab.dart';
import 'package:evently/screens/home/tabs/map_tab.dart';
import 'package:evently/screens/home/tabs/profile_tab.dart';
import 'package:evently/screens/login/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../providers/user_provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  int selectedCategoryIndex = 0;
  List<Widget> tabs = [];
  List<String> categories = [
    "All",
    "Eating",
    "Birthday",
    "BookClub",
    "Exhibition",
    "Gaming",
    "Holiday",
    "Meeting",
    "Sport",
    "Workshop",
  ];

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar:currentIndex==3?AppBar(
        backgroundColor: Color(0xFF5669FF),
        toolbarHeight: 190,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(64.r))
        ),
        title: Row(
          children: [
            Image.asset("assets/images/profile_bar.png",height: 124.h,),
            SizedBox(width: 16,),
            Column(children: [
              Text("Name",style: GoogleFonts.inter(
                fontWeight: FontWeight.bold,
                fontSize: 24.sp
                  ,color: Colors.white
              ),),
              SizedBox(height: 10,),
              Text("email.com",style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp
                  ,color: Colors.white
              ),),
            ],)

          ],
        ),
      ):
      AppBar(
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              userProvider.clearData();
              Navigator.pushNamedAndRemoveUntil(
                context,
                LoginScreen.routeName,
                    (route) => false,
              );
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
        backgroundColor: Color(0xFF5669FF),
        toolbarHeight: 160.h,
        centerTitle: false,
        titleSpacing: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(24.r),
            bottomLeft: Radius.circular(24.r),
          ),
        ),
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Welcome Back ✨",
                  style: GoogleFonts.inter(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.sunny, color: Colors.white, size: 30),
                    SizedBox(width: 8.w),
                    Container(
                      height: 35.h,
                      width: 35.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors.white,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "EN",
                        style: GoogleFonts.inter(
                          color: Color(0xFF5669FF),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  userProvider.userModel?.name ?? "null",
                  style: GoogleFonts.inter(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.w),
            Row(
              children: [
                Icon(Icons.location_on_outlined, color: Colors.white, size: 20),
                Text(
                  "Cairo , Egypt",
                  style: GoogleFonts.inter(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Container(
              height: 40,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(width: 8),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      selectedCategoryIndex = index;
                      setState(() {});
                    },
                    child: Container(
                      width: 130,
                      padding: EdgeInsets.all(2),

                      //ليه اما بحط height هنابتضرب
                      decoration: BoxDecoration(
                        color: selectedCategoryIndex == index
                            ? Colors.white
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(37),
                        border: Border.all(color: Colors.white),
                      ),

                      child: Center(
                        child: Text(
                          categories[index],
                          style: GoogleFonts.inter(
                            color: selectedCategoryIndex == index
                                ? Color(0xFF5669FF)
                                : Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: categories.length,
              ),
            ),
          ],
        ),
      )
      ,

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF5669FF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.r),
          side: BorderSide(color: Colors.white, width: 4.w),
        ),
        onPressed: () {
          Navigator.pushNamed(context, CreateEvent.routeName);
        },
        child: Icon(Icons.add, color: Colors.white, size: 40),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 6,
        shape: CircularNotchedRectangle(),
        color: Color(0xFF5669FF),
        padding: EdgeInsets.zero,
        child: BottomNavigationBar(
          onTap: (value) {
            currentIndex = value;
            setState(() {});
          },
          elevation: 0,
          backgroundColor: Colors.transparent,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13.sp,
          ),
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13.sp,
          ),
          type: BottomNavigationBarType.fixed,

          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled, color: Colors.white, size: 30),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.location_on_outlined,
                color: Colors.white,
                size: 30,
              ),
              label: "Map",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline, color: Colors.white, size: 30),
              label: "Love",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.white, size: 30),
              label: "Profile",
            ),
          ],
        ),
      ),
      body: [
        EventTab(category: categories[selectedCategoryIndex]),
        MapTab(),
        FavouriteTab(),
        ProfileTab(),
      ][currentIndex],
    );
  }
}
