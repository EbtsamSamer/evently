import 'package:evently/firebase/firebase_manager.dart';
import 'package:evently/models/userRequestData.dart';
import 'package:evently/screens/home/home_screen.dart';
import 'package:evently/screens/login/login_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = "SignUpScreen";

  SignUpScreen({super.key});

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
var formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key:formKey ,
          child: Column(
            children: [
              SizedBox(height: 30),
              Center(child: Image.asset("assets/images/logo_v.png")),
              SizedBox(height: 24),
              TextFormField(
                validator: (value) {
                  if(value== null||value.isEmpty){
                    return "Name is Required";
                  }
                  return null;
                },
                controller: nameController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person, color: Color(0xFF7B7B7B)),
                  label: Text(
                    "Name",
                    style: GoogleFonts.inter(
                      color: Color(0xFF7B7B7B),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  errorBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                validator: (value) {
                  if(value== null||value.isEmpty){
                    return "Phone is Required";
                  }else if(value.length !=11){
                    return "Phone Not Valid";
                  }
                  return null;
                },
                controller: phoneController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.call, color: Color(0xFF7B7B7B)),
                  label: Text(
                    "Phone",
                    style: GoogleFonts.inter(
                      color: Color(0xFF7B7B7B),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  errorBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                validator: (value) {
                  if(value==null||value.isEmpty){
                    return "Email is Required";
                  }
                  final bool emailValid =
                  RegExp(r"^[a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@gmail\.com$")
                      .hasMatch("value");
                  return null;
                },
                controller: emailController,
                decoration: InputDecoration(
                  prefixIcon: ImageIcon(
                    AssetImage("assets/images/email_ic.png"),
                    color: Color(0xFF7B7B7B),
                  ),
                  label: Text(
                    "Email",
                    style: GoogleFonts.inter(
                      color: Color(0xFF7B7B7B),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  errorBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                validator: (value) {
                  if(value== null||value.isEmpty){
                    return "Password is Required";
                  }if(value.length<6){
                    return "Password is Weak";
                  }
                  return null;
                },
                controller: passwordController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock, color: Color(0xFF7B7B7B)),
                  suffixIcon: Icon(
                    Icons.remove_red_eye,
                    color: Color(0xFF7B7B7B),
                  ),
                  label: Text(
                    "Password",
                    style: GoogleFonts.inter(
                      color: Color(0xFF7B7B7B),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  errorBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                validator: (value) {
                  if(value== null||value.isEmpty){
                    return "Re Password is Required";
                  }
                  if(value !=passwordController.text){
                    return "Password Not Match";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock, color: Color(0xFF7B7B7B)),
                  suffixIcon: Icon(
                    Icons.remove_red_eye,
                    color: Color(0xFF7B7B7B),
                  ),
                  label: Text(
                    "Re Password",
                    style: GoogleFonts.inter(
                      color: Color(0xFF7B7B7B),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  errorBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(400, 60),
                  backgroundColor: Color(0xFF5669FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  if(formKey.currentState!.validate()){
                    UserModel user = UserModel(
                      nameController.text,
                      phoneController.text,
                      emailController.text,
                      " ",

                    );

                    FirebaseManager.signUP(
                      user: user,
                      password: passwordController.text,
                      OnError: (value){
                        showDialog(context: context, builder: (context)=>AlertDialog(
                          title: Text("Error",style: GoogleFonts.inter(
                              color: Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.w500
                          ),),
                          content: Text(value,style: GoogleFonts.inter(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                          ),),
                          actions: [ElevatedButton(onPressed: (){
                            Navigator.pop(context);
                          }, child: Text("Okay" ,style: GoogleFonts.inter(
                              color: Colors.indigo,
                              fontSize: 20,
                              fontWeight: FontWeight.w500
                          ),)
                          )
                          ],
                        )
                        );
                      },
                      OnSuccess: (){
                        Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false,);
                      }

                    );
                  }

                },
                child: Text(
                  "Create Account",
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 24),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Already Have Account? ",
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, LoginScreen.routeName);
                        },
                      text: "Login ",
                      style: GoogleFonts.inter(
                        decoration: TextDecoration.underline,
                        color: Color(0xFF5669FF),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
