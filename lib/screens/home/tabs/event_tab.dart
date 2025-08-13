import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:evently/firebase/firebase_manager.dart';
import 'package:evently/models/event_model.dart';
import 'package:evently/screens/event/edit_event.dart';
import 'package:evently/screens/event/event_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class EventTab extends StatelessWidget {
  String category;


  EventTab({super.key, required this.category});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<TaskModel>>(
      stream: FirebaseManager.getTasks(category: category),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator(color: Colors.blue));
        } else if (snapshot.hasError) {
          return Text("Something went wrong");
        } else if (snapshot.data!.docs.isEmpty) {
          return Center(
            child: Text(
              "NO Events is Created",
              style: GoogleFonts.inter(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.separated(
            itemBuilder: (context, index) {
              var date = DateTime.fromMillisecondsSinceEpoch(
                snapshot.data!.docs[index].data().date,
              );
              String month = DateFormat('MMM').format(date);
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    EditEvent.routeName,
                    arguments: snapshot.data?.docs[index].data(),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * 0.23,
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r),
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/images/${snapshot.data?.docs[index].data().category}.png",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 50.h,
                          width: 45.w,
                          decoration: BoxDecoration(
                            color: Colors.indigo.shade100,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.all(4),
                          margin: EdgeInsets.only(left: 8, top: 6),
                          child: Column(
                            children: [
                              Text(
                                date.toString().substring(8, 10),
                                style: GoogleFonts.inter(
                                  color: Color(0xFF5669FF),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp,
                                ),
                              ),
                              Text(
                                month,
                                style: GoogleFonts.inter(
                                  color: Color(0xFF5669FF),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 40.h,
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ListTile(
                            title: Text(
                              "${snapshot.data!.docs[index].data().title ?? ""}",
                            ),
                            trailing: InkWell(
                              onTap: () {
                                FirebaseManager.addTaskFav(
                                  snapshot.data!.docs[index].data().id,
                                  !snapshot.data!.docs[index].data().isFav,
                                );
                              },

                              child: snapshot.data!.docs[index].data().isFav
                                  ? Icon(Icons.favorite, color: Colors.blue)
                                  : Icon(Icons.favorite_outline),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 16),
            itemCount: snapshot.data?.docs.length ?? 0,
          ),
        );
      },
    );
  }
}
