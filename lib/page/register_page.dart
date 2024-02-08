import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:instagram_clon/page/user_detail_page.dart';

import '../util/navigator.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final _fullName = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _passwordConfirm = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/img/instagram.png",),
                Gap(10),
                CupertinoTextField(
                  controller: _fullName,
                  cursorColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white12.withOpacity(.1)
                  ),
                  placeholder: "Fullname",
                ),
                Gap(20),
                CupertinoTextField(
                  controller: _email,
                  cursorColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white12.withOpacity(.1)
                  ),
                  placeholder: "Email, phone number or username",
                ),
                Gap(20),
                CupertinoTextField(
                  controller: _password,
                  cursorColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white12.withOpacity(.1)
                  ),
                  placeholder: "Password",
                ),
                Gap(20),
                CupertinoTextField(
                  controller: _passwordConfirm,
                  cursorColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white12.withOpacity(.1)
                  ),
                  placeholder: "Password Confirm",
                ),
                Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AppleAuthButton(onPressed: () {}, darkMode: true, style: AuthButtonStyle(elevation: 1, iconSize: 25, textStyle: TextStyle(fontSize: 15, color: Colors.white)),),
                    Gap(20),
                    GoogleAuthButton(onPressed: () {}, darkMode: true, style: AuthButtonStyle(elevation: 1, iconSize: 25, textStyle: TextStyle(fontSize: 15, color: Colors.white)),),
                    Gap(20),
                    FacebookAuthButton(onPressed: () {}, darkMode: true, style: AuthButtonStyle(elevation: 1, iconSize: 25, textStyle: TextStyle(fontSize: 15, color: Colors.white)),),
                  ],
                ),
                Gap(20),
                SizedBox(
                  width: double.infinity,
                  child: CupertinoButton(child: Text('Next', style: TextStyle(
                    color:Colors.white,
                  ),),
                    onPressed: () {

                      if(_fullName.text.isNotEmpty && _email.text.isNotEmpty && _password.text == _passwordConfirm.text) {
                      navigate(context, UserDetailPage(fullName: _fullName.text, email: _email.text, password: _password.text));
                      }
                    }, color: Colors.blue,
                  ),
                ),
                Gap(50),
                CupertinoButton(child: Text("Already have an account? Login"), onPressed: () => Navigator.of(context).pop()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}