import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

class UserDetailPage extends StatefulWidget {
  const UserDetailPage(
      {super.key,
        required this.fullName,
        required this.email,
        required this.password});

  final String fullName;
  final String email;
  final String password;

  @override
  State<UserDetailPage> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  XFile? xFile;
  final _picker = ImagePicker();
  final _bio = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setup Profile'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Gap(20),
            _imageSection(),
            Gap(30),
            CupertinoTextField(
              cursorColor: Colors.white,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white12.withOpacity(.1)),
              placeholder: "Bio (Your age, About you",
            ),
            Gap(20),
            SizedBox(
              width: double.infinity,
              child: CupertinoButton(
                child: Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {},
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _imageSection() {
    return GestureDetector(
        onTap: () => _launchGallery(),
        child: Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
              shape: BoxShape.circle, border: Border.all(color: Colors.white)),
          child: xFile == null
              ? const Icon(CupertinoIcons.photo, color: Colors.white)
              : Image.file(File(xFile?.path ?? "")),
        ));
  }

  void _launchGallery() async {
    final file = await _picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      setState(() {
        xFile = file;
      });
    }
  }
}
