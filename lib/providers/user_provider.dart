import 'package:evently/firebase/firebase_manager.dart';
import 'package:evently/models/userRequestData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier{
  User? firebaseUser;
  UserModel? userModel;
  UserProvider(){
    firebaseUser=FirebaseAuth.instance.currentUser;
    if(firebaseUser!=null){
      initUser();
    }
  }
   initUser()async{
    //read userdata from DB
   userModel=await FirebaseManager.readUserData();
   notifyListeners();
  }
  clearData(){
    userModel=null;
    firebaseUser=null;
    notifyListeners();
  }
}