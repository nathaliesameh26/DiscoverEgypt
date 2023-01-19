import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:mobileapplication/model/user.dart';
import '../model/user_model.dart';
import 'package:mobileapplication/widget/profile_widget.dart';
import 'package:mobileapplication/widget/textfield_widget.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  User user = UserPreferences.myUser;
  PlatformFile? pickedFile;
  ImageProvider? image;
  Future uploadFile() async {
    final path = 'files/${pickedFile!.name}';
    final file = File(pickedFile!.path!);
    final ref = FirebaseStorage.instance.ref().child(path);
    ref.putFile(file);
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    setState(() {
      pickedFile = result.files.first;
    });
  }

//##############################update test#############################
  Map<String, String> dataToUpdate = {};
  CollectionReference collection =
      FirebaseFirestore.instance.collection('users');
  //DocumentReference document = collection.doc('id');

  //##########################end update test#####################################
  @override
  Widget build(BuildContext context) => Scaffold(
        //appBar: buildAppBar(context),

        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 32),
          physics: BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 50),
            if (pickedFile != null)
              Expanded(
                  child: Container(
                      color: Colors.blue[100],
                      child: Image.file(
                        File(pickedFile!.path!),
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ))),
            // const CircleAvatar(
            //   backgroundColor: Colors.blue,
            //   backgroundImage: NetworkImage(
            //       'https://console.firebase.google.com/u/1/project/discoveregypt-18220/storage/discoveregypt-18220.appspot.com/files'),
            // ),
            ProfileWidget(
              imagePath: user.imagePath,
              isEdit: true,
              onClicked: () async {},
            ),
            ElevatedButton(
              onPressed: selectFile,
              child: Text("select image"),
            ),
            ElevatedButton(onPressed: uploadFile, child: Text("upload image")),
            ElevatedButton(
              child: Text("Update"),
              onPressed: (() {
                final docUser = FirebaseFirestore.instance
                    .collection('users')
                    .doc('GwBywSu38lShNnea4TCw');

                docUser.update({
                  'firstname': 'Test Update1',
                });
              }),
            ),
            // ElevatedButton(
            //   child: Text("Delete User"),
            //   onPressed: (() {
            //     final docUser = FirebaseFirestore.instance
            //         .collection('users')
            //         .doc('GwBywSu38lShNnea4TCw');

            //     docUser.update({
            //       'firstname': FieldValue.delete(),
            //       'lastname': FieldValue.delete(),
            //       'email': FieldValue.delete(),
            //       'nationality': FieldValue.delete(),
            //       'password': FieldValue.delete(),
            //     });
            //   }),
            // ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Full Name',
              text: user.name,
              onChanged: (name) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Email',
              text: user.email,
              onChanged: (email) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Password',
              text: user.password,
              onChanged: (password) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'About',
              text: user.about,
              maxLines: 5,
              onChanged: (about) {},
            ),
          ],
        ),
      );
}
