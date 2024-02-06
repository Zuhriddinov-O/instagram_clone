import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:instagram_clon/page/main_page.dart';
import 'package:instagram_clon/page/register_page.dart';
import 'package:instagram_clon/util/navigator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/img/text.png",
                    color: Colors.white, width: 200, height: 200),
                Gap(10),
                CupertinoTextField(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white12.withOpacity(.1)),
                  placeholder: "Email,Phone Number or User Name",
                ),
                Gap(20),
                CupertinoTextField(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white12.withOpacity(.1)),
                  placeholder: "Email,Phone Number or User Name",
                ),
                Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AppleAuthButton(
                        onPressed: () {},
                        darkMode: true,
                        text: "Apple",
                        style: AuthButtonStyle(
                            elevation: 1,
                            iconSize: 25,
                            textStyle:
                                TextStyle(fontSize: 15, color: Colors.white))),
                    Gap(10),
                    GoogleAuthButton(
                        onPressed: () {},
                        darkMode: true,
                        text: "Google",
                        style: AuthButtonStyle(
                            elevation: 1,
                            iconSize: 25,
                            textStyle:
                                TextStyle(fontSize: 15, color: Colors.white))),
                    Gap(10),
                    FacebookAuthButton(
                        onPressed: () {},
                        darkMode: true,
                        text: "Facebook",
                        style: AuthButtonStyle(
                            elevation: 1,
                            iconSize: 25,
                            textStyle:
                                TextStyle(fontSize: 15, color: Colors.white))),
                  ],
                ),
                Gap(20),
                SizedBox(
                  width: double.infinity,
                  child: CupertinoButton(
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(CupertinoPageRoute(builder: (context) => MainPage(),));
                    },
                    color: Colors.blue,
                  ),
                ),
                CupertinoButton(
                  child: Text("Don't have an Account? Register"),
                  onPressed: () {
                    navigate(context, RegisterPage());
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
