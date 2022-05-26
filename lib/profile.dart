import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_anybarcodescan/styles/main_colors.dart';
import 'package:flutter_anybarcodescan/styles/text_style/style_profile.dart';

import 'styles/text_style/style_contacts_page.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _StateProfilePage();
  }
}

class _StateProfilePage extends State<ProfilePage> {
  final String textName = "Name and Surname";
  final String textPhone = "My telephone";
  final String textEmail = "email";
  final String textWriteAdmin = "Phone";
  bool edit_name = false;
  bool edit_phone = false;
  bool edit_email = false;
  FocusNode? focusNodeName;
  FocusNode? focusNodePhone;
  FocusNode? focusNodeEmail;
  String name_surname = "abc";

  String phone = "+7900901156";
  final TextStyle styleUp = TextStyle(
      color: color_text_super_light_grey,
      fontSize: 12.0,
      fontWeight: FontWeight.w200);
  final TextStyle styleDown = TextStyle(
      color: color_text_black, fontSize: 18.0, fontWeight: FontWeight.w200);

  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerPhone = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  height: screenHeight * 0.14,
                  child: Image.asset("assets/logo.png"),
                ),
              ],
            ),
            _buildNameSurname(screenHeight, screenWidth),
            _buildPhone(screenHeight, screenWidth),
            _buildEmail(screenHeight, screenWidth),
            _buildWriteAdm(screenHeight, screenWidth),
          ],
        ),
      ),
    );
  }

  Widget _buildNameSurname(screenHeight, screenWidth) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: Color.fromRGBO(81, 81, 81, 1), width: 0.2))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: screenWidth * 0.7,
              child: TextField(
                focusNode: focusNodeName,
                enabled: edit_name,
                controller: _controllerName,
                decoration: InputDecoration(
                    labelText: textName,
                    labelStyle: styleUp,
                    border: InputBorder.none),
              ),
            ),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: color_text_grey,
                    offset: Offset(0.0, 0.5),
                    blurRadius: 0.4,
                  )
                ], shape: BoxShape.circle, color: color_text_white),
                child: Icon(
                  edit_name ? Icons.check : Icons.mode_edit,
                  color: edit_name
                      ? color_button_next
                      : color_text_super_light_grey,
                  size: 20.0,
                ),
              ),
              onTap: () {
                EditValue("name");
                if (edit_name) {
                  setState(() {
                    edit_name = false;
                    // focusNodeName.unfocus();
                  });
                } else {
                  setState(() {
                    edit_name = true;
                  });
                  // focusNodeName.requestFocus();
                }
              },
            )
          ],
        ),
      ),
      onTap: () {
        EditValue("name");
        setState(() {
          edit_name = true;
        });
        // focusNodeName.requestFocus();
      },
    );
  }

  EditValue(String val) {
    switch (val) {
      case "name":
        print("edit_name");

        break;
      case "phone":
        print("edit_phone");

        break;
      case "email":
        print("edit_email");

        break;
    }
    ;
  }

  Widget _buildEmail(screenHeight, screenWidth) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: Color.fromRGBO(81, 81, 81, 1), width: 0.2))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: screenWidth * 0.7,
              child: TextField(
                focusNode: focusNodeEmail,
                enabled: edit_email,
                controller: _controllerEmail,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: textName,
                  labelStyle: styleUp,
                ),
              ),
            ),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: color_text_grey,
                    offset: Offset(0.0, 0.5),
                    blurRadius: 0.4,
                  )
                ], shape: BoxShape.circle, color: color_text_white),
                child: Icon(
                  edit_email ? Icons.check : Icons.mode_edit,
                  color: edit_email
                      ? color_button_next
                      : color_text_super_light_grey,
                  size: 20.0,
                ),
              ),
              onTap: () {
                EditValue("email");
                if (edit_email) {
                  setState(() {
                    edit_email = false;
                    // focusNodeEmail.unfocus();
                  });
                } else {
                  setState(() {
                    edit_email = true;
                  });
                  //  focusNodeEmail.requestFocus();
                }
              },
            )
          ],
        ),
      ),
      onTap: () {
        EditValue("email");
        setState(() {
          edit_email = true;
        });
        // focusNodeEmail.requestFocus();
      },
    );
  }

  Widget _buildPhone(screenHeight, screenWidth) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: Color.fromRGBO(81, 81, 81, 1), width: 0.2))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: screenWidth * 0.7,
              child: TextField(
                focusNode: focusNodePhone,
                enabled: edit_phone,
                controller: _controllerPhone,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: textName,
                  labelStyle: styleUp,
                ),
              ),
            ),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: color_text_grey,
                    offset: Offset(0.0, 0.5),
                    blurRadius: 0.4,
                  )
                ], shape: BoxShape.circle, color: color_text_white),
                child: Icon(
                  edit_phone ? Icons.check : Icons.mode_edit,
                  color: edit_phone
                      ? color_button_next
                      : color_text_super_light_grey,
                  size: 20.0,
                ),
              ),
              onTap: () {
                EditValue("phone");
                if (edit_phone) {
                  setState(() {
                    edit_phone = false;
                    //  focusNodePhone.unfocus();
                  });
                } else {
                  setState(() {
                    edit_phone = true;
                  });
                  // focusNodePhone.requestFocus();
                  FocusScope.of(context).requestFocus(focusNodePhone);
                }
              },
            )
          ],
        ),
      ),
      onTap: () {
        EditValue("phone");
        setState(() {
          edit_phone = true;
        });
        // focusNodePhone.requestFocus();
        FocusScope.of(context).requestFocus(focusNodePhone);
      },
    );
  }

  Widget _buildWriteAdm(screenHeight, screenWidth) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: Color.fromRGBO(81, 81, 81, 1), width: 0.2))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                width: screenWidth * 0.6,
                child: Text(
                  'A user profile is a collection of settings and information associated with a user."',
                  maxLines: 2,
                  style: style_main_text,
                  textAlign: TextAlign.left,
                )),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: color_text_grey,
                  offset: Offset(0.0, 0.5),
                  blurRadius: 0.4,
                )
              ], shape: BoxShape.circle, color: color_text_white),
              child: Icon(
                Icons.arrow_forward_ios,
                color: color_text_super_light_grey,
                size: 20.0,
              ),
            )
          ],
        ),
      ),
      onTap: () {},
    );
  }

  @override
  void initState() {
    super.initState();
    final String uid = FirebaseAuth.instance.currentUser!.uid;
    final String email = FirebaseAuth.instance.currentUser!.email.toString();
    User? user = FirebaseAuth.instance.currentUser;

    _controllerName.text = uid;
    _controllerEmail.text = email;
    _controllerPhone.text = phone;
    focusNodeName = FocusNode();
    focusNodePhone = FocusNode();
    focusNodeEmail = FocusNode();
  }

  void dispose() {
    // focusNodeName.dispose();
    // focusNodeEmail.dispose();
    // focusNodePhone.dispose();

    super.dispose();
  }
}
