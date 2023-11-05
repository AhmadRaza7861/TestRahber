import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../../global/common/toast.dart';
import '../../../../state/auth_controller.dart';
import '../widgets/form_container_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthController _authController=Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("HomePage"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(
              "Welcome Home buddy!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
            )),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
               _authController.signOut(context: context);
              },
              child: Container(
                height: 45,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    "Sign out",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ),
            ),
            Center(
                child: Obx(()=>
                  Text(
                   "Name : ${_authController.userData.value.name.toString()}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                  ),
                )),
            FormContainerWidget(
              controller: _authController.changeText,
              hintText: "CHange name",
            ),
            ElevatedButton(onPressed: ()async{
             await _authController.ChangeName(email:_authController.userData.value.email.toString(),name:_authController.changeText.text);
              _authController.changeText.text="";
            }, child: Text("Changed"))
          ],
        ));
  }
}
