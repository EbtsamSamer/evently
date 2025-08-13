import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../firebase/firebase_manager.dart';
import '../../models/event_model.dart';

class EditEvent extends StatefulWidget {
  static const String routeName="EditEvent";

   EditEvent({super.key});

  @override
  State<EditEvent> createState() => _EditEventState();
}

class _EditEventState extends State<EditEvent> {
  int selectedImageIndex = 0;

  int selectedCategoryIndex = 0;

  List<String> images = [
    "eating",
    "birthday",
    "bookclub",
    "exhibition",
    "gaming",
    "holiday",
    "meeting",
    "sport",
    "workshop",
  ];

  List<String> categories = [
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
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();

  late TaskModel event;
  @override
  Widget build(BuildContext context) {

      return Scaffold(
        appBar: AppBar(
          title: Text("Edit Event",
            style: GoogleFonts.tiroTamil(
              color: Color(0xFF5669FF),
              fontWeight: FontWeight.w400,
            ),),
        ),
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    "assets/images/${images[selectedImageIndex]}.png",
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  height: 50,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(width: 8),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          selectedImageIndex = index;
                          selectedCategoryIndex = index;
                          setState(() {});
                        },
                        child: Container(
                          width: 130,
                          //ليه اما بحط height هنابتضرب
                          decoration: BoxDecoration(
                            color: selectedCategoryIndex == index
                                ? Color(0xFF5669FF)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(37),
                            border: Border.all(color: Color(0xFF5669FF)),
                          ),

                          child: Center(
                            child: Text(
                              categories[index],
                              style: GoogleFonts.inter(
                                color: selectedCategoryIndex == index
                                    ? Colors.white
                                    : Color(0xFF5669FF),
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: categories.length,
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Title",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),

                    prefix: Icon(
                      Icons.border_color_outlined,
                      color: Color(0xFF7B7B7B),
                    ),
                    label: Text(
                        "title",
                      style: GoogleFonts.inter(
                        color: Color(0xFF7B7B7B),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Description",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: descriptionController,
                  maxLines: 4,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    label: Text(
                      " ",
                      style: GoogleFonts.inter(
                        color: Color(0xFF7B7B7B),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.calendar_month_outlined),
                        SizedBox(width: 8),
                        Text(
                          "Event Date",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        selectDate();
                      },
                      child: Text(
                        selectedDate.toString().substring(0, 10),
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Color(0xFF5669FF),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Location",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  height: 65,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
                SizedBox(height: 16),
                Container(
                  height: 55,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF5669FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {


                    },
                    child: Text(
                      "Update Event",
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],

            ),
          ),
        )
        );
      }

  selectDate() async {
    DateTime? choosenDate = await showDatePicker(

        builder: (context, child) {
          return Theme(data: ThemeData(
              colorScheme: ColorScheme.light(
                  primary: Colors.lightBlue,
                  onPrimary: Colors.white,
                  onSurface: Colors.blueAccent
              )
          )


              , child: child!);
        },
        initialDate: selectedDate,
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365))
    );
    if (choosenDate != null) {
      selectedDate = choosenDate;
      setState(() {

      });
    }
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context)!.settings.arguments;
    if (args is TaskModel) {
      event = args;
      titleController.text = event.title;
      descriptionController.text = event.description;
      selectedDate = DateTime.fromMillisecondsSinceEpoch(event.date);
      selectedCategoryIndex = categories.indexOf(event.category);
      selectedImageIndex = images.indexOf(event.category);
    }
  }

}

