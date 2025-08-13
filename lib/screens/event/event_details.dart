
import 'package:evently/screens/event/edit_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../firebase/firebase_manager.dart';

class EventDetails extends StatelessWidget {
  static const String routeName = "EventDetails";

  EventDetails({super.key});
  String? category;




  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseManager.getTasks(category: category),
      builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(child: CircularProgressIndicator(color: Colors.blue));
    }
    // var date = DateTime.fromMillisecondsSinceEpoch(
    //   snapshot.data!.docs[index].data().date,
    // );
   // String month = DateFormat('MMM').format(date);
    return Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      "EventDetails",
                      style: GoogleFonts.tiroTamil(
                        color: Color(0xFF5669FF),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      EditEvent.routeName,
                    );
                  },
                  child: ImageIcon(
                    AssetImage("assets/images/edit.png"),
                    color: Color(0xFF5669FF),
                  ),
                ),
                SizedBox(width: 10.h),
                ImageIcon(
                  AssetImage("assets/images/delete.png"),
                  color: Colors.redAccent,
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset("assets/images/sport.png"),
                ),
                Text(
                  "We Are Going To Play Football",
                  style: GoogleFonts.inter(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF5669FF),
                  ),
                ),
                Container(
                  height: 65,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Color(0xFF5669FF), width: 1),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 48.h,
                        width: 48.w,
                        decoration: BoxDecoration(
                          color: Color(0xFF5669FF),
                          borderRadius: BorderRadius.circular(8.r),
                        ),

                        child: Icon(
                          Icons.calendar_month_outlined,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "21 November 2025",
                            style: GoogleFonts.inter(
                              color: Color(0xFF5669FF),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "12:12PM",
                            style: GoogleFonts.inter(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 65,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Color(0xFF5669FF), width: 1),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 48.h,
                        width: 48.w,
                        decoration: BoxDecoration(
                          color: Color(0xFF5669FF),
                          borderRadius: BorderRadius.circular(8.r),
                        ),

                        child: ImageIcon(
                          AssetImage("assets/images/map_ic.png"),
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Text(
                          "Cairo,Egypt",
                          style: GoogleFonts.inter(
                            color: Color(0xFF5669FF),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Color(0xFF5669FF),
                        size: 15,
                      ),
                    ],
                  ),
                ),
                Text(
                  "Description",
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Lorem ipsum dolor sit amet consectetur. Vulputate eleifend suscipit eget "
                      "neque senectus a. Nulla at non malesuada odio duis lectus amet nisi sit."
                      " Risus hac enim maecenas auctor et. At cras massa diam porta facilisi "
                      "lacus purus. Iaculis eget quis ut amet. Sit ac malesuada nisi quis  "
                      "feugiat.",
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
