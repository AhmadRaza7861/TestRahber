
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/Model/user_model.dart';
import 'package:firebase_authentication/routs/route_constents.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../features/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import '../global/common/toast.dart';

class AuthController extends GetxController
{
  var isSigning = false.obs;
  final FirebaseAuthService _auth = FirebaseAuthService();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController changeText = TextEditingController();

  var userData=UserModel(email: "",name: "").obs;

  var isSigningUp = false.obs;

  void signIn({required BuildContext context}) async {
    isSigning.value = true;
    String email = emailController.text;
    String password = passwordController.text;
    User? user = await _auth.signInWithEmailAndPassword(email, password);
    if(user!=null)
      {
       await  getName(email: email);
      }
      isSigning.value = false;

    if (user != null) {
      showToast(message: "User is successfully signed in");
      emailController.text="";
      passwordController.text="";
      usernameController.text="";
      context.replaceNamed(RouteConstants.home);
    } else {
      showToast(message: "some error occured");
    }
  }

  void signOut({required BuildContext context})
  {
    FirebaseAuth.instance.signOut();
    showToast(message: "Successfully signed out");
    context.replaceNamed(RouteConstants.logIn);
  }

  void signUp({required BuildContext context}) async {


      isSigningUp.value = true;

    String username = usernameController.text;
    String email = emailController.text;
    String password = passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);
    await FirebaseFirestore.instance.collection("UserExample").doc(email).set({
      "UserName":username,
      "email":email
    }).then((value)
    {
      getName(email: email);
    });

      isSigningUp.value = false;

    if (user != null) {
      showToast(message: "User is successfully created");
      emailController.text="";
      passwordController.text="";
      usernameController.text="";
      context.replaceNamed(RouteConstants.home);
    } else {
      showToast(message: "Some error happend");
    }
  }

  Future getName({required String email}) async{
   DocumentSnapshot document= await FirebaseFirestore.instance.collection("UserExample").doc(email).get();
   Map<String, dynamic> data = document.data() as Map<String, dynamic>;
   print("DATA ${data}");
   UserModel user=UserModel.fromJson(data);
   userData.value=UserModel(name: user.name,email: user.email);
   print("DATA ${userData.value}");
  }
  Future ChangeName({required String name,required String email}) async{
    await FirebaseFirestore.instance.collection("UserExample").doc(email).update(
      {
        "UserName":name,
        "email":email
      }
    ).then((value) async
    {
     await getName(email:email );
    }
    );
  }
}