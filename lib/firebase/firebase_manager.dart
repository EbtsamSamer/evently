import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:evently/models/event_model.dart';
import 'package:evently/models/userRequestData.dart';
import 'package:firebase_auth/firebase_auth.dart';


class FirebaseManager {

   static CollectionReference<TaskModel> getTasksCollection(){
   return FirebaseFirestore.instance.collection("Tasks").withConverter<TaskModel>(
      fromFirestore:(snapshot, options) {
        return TaskModel.fromJson(snapshot.data()!);
      } ,
      toFirestore: (model, options) {
        return model.toJson();
      },);
  }

 static Future<void> createEvent(TaskModel task)async{
     // var docShot=await getTasksCollection().add(task);
     var doc=  getTasksCollection().doc();
     task.id=doc.id;
     await doc.set(task);
  }
   static Future<void> updateEvent(TaskModel task)async{
     var doc = getTasksCollection().doc(task.id);
     await doc.set(task);
   }
  static Stream<QuerySnapshot<TaskModel>>getTasks({String ?category,bool ?isFav}) {
     if(category=="All"||category==null){
       return getTasksCollection().where("userId",isEqualTo: FirebaseAuth.instance.currentUser!.uid).snapshots();
     }
     if(isFav==true){
       return getTasksCollection().where("isFav",isEqualTo: isFav).where("userId",isEqualTo: FirebaseAuth.instance.currentUser!.uid).snapshots();
     }
    return getTasksCollection().where("category",isEqualTo: category).where("userId",isEqualTo: FirebaseAuth.instance.currentUser!.uid).snapshots();
  }

  static addTaskFav(String id,bool flag){
     getTasksCollection().doc(id).update({"isFav":flag});
   }
   static CollectionReference<UserModel> getUsersCollection(){
     return FirebaseFirestore.instance.collection("Users").withConverter<UserModel>(
       fromFirestore:(snapshot, _) {
         return UserModel.fromJson(snapshot.data()!);
       } ,
       toFirestore: (model, _) {
         return model.toJson();
       },);
   }
  static Future<void> createUserAccount(UserModel user){
    var docRef= getUsersCollection().doc(user.id);
    return docRef.set(user);
 }
 static login({
   required String email,
   required String password,
   required Function OnError,
   required Function OnSuccess,
})async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      OnSuccess();
    } on FirebaseAuthException catch (e) {
      OnError(e.message);
      if (e.code == 'weak-password') {

      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
  static signUP({
    required UserModel user,
    required String password,
    required Function OnError,
    required Function OnSuccess,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email,
        password: password,

      );
      await credential.user?.sendEmailVerification();
      print("User registered and verification email sent.");
      user.id=credential.user!.uid;
      createUserAccount(user);
      OnSuccess();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        OnError("The email is already in use.");
      } else if (e.code == 'invalid-email') {
        OnError("The email address is invalid.");

      } else {
        print('Error: ${e.code}');
      }
    } catch (e) {
      print(e);
    }
  }
  static Future<UserModel?>  readUserData()async{
     try {
       DocumentSnapshot<UserModel>docRef=await getUsersCollection().doc(FirebaseAuth.instance.currentUser!.uid).get();
       return docRef.data();
     }catch(e){
       return null;
     }

  }

}
