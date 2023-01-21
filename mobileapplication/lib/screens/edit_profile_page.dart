import 'dart:io';

import 'package:binder/binder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobileapplication/data/dataApp/user_data.dart';
import 'package:mobileapplication/data/repo/user_provider.dart';
import '../model/user_model.dart';
import 'package:mobileapplication/widget/profile_widget.dart';
import 'package:mobileapplication/widget/textfield_widget.dart';

class EditProfilePage extends ConsumerStatefulWidget {
  @override
  ConsumerState<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends ConsumerState<EditProfilePage> {
  var user = UserPreferences.myUser;
  final userData = UserData();
  // User user = UserPreferences.myUser;
  PlatformFile? pickedFile;
  ImageProvider? image;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController lastnameController;
  @override
  void initState() {
    super.initState(); // get old value and put it in txtfields
    final watchValue = ref.read(userDataProvider).value;

    nameController = TextEditingController(text: 'Enter your first name');
    emailController = TextEditingController(text: 'Email');
    passwordController = TextEditingController(text: 'type you password');
    lastnameController = TextEditingController(text: 'lastname');
  }

//********************uploadfile ***********************/
  Future uploadFile() async {
    final path = 'files/${pickedFile!.name}';
    final file = File(pickedFile!.path!);
    final ref = FirebaseStorage.instance.ref().child(path);
    ref.putFile(file);
  }

//********************end-upload**************** */

//*****************Select picture**************** */
  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    setState(() {
      pickedFile = result.files.first;
    });
  }

//*******************end-select********************* */
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

            ProfileWidget(
              imagePath: user.imagePath,
              isEdit: true,
              onClicked: () async {},
            ),
            ElevatedButton(
              onPressed: selectFile,
              child: const Text("select image"),
            ),
            ElevatedButton(
                onPressed: uploadFile, child: const Text("upload image")),
            //######################update################################
            ElevatedButton(
              child: Text("Update"),
              onPressed: (() {
                userData.updateUserDetails(
                    nameController.text,
                    emailController.text,
                    passwordController.text,
                    lastnameController.text);
              }),
            ),
            //#######################end-update#######################

            //##############################delete########################
             ElevatedButton(
               child: Text("Delete User"),
               onPressed: (() {
                final docUser = FirebaseFirestore.instance
                   .collection('users')
                  .doc('GwBywSu38lShNnea4TCw');

              docUser.update({
                 'firstname': FieldValue.delete(),
                 'lastname': FieldValue.delete(),
               'email': FieldValue.delete(),
                 'nationality': FieldValue.delete(),
            //       'password': FieldValue.delete(),
            //     });
            //   }),
            // ),
            //#################################end-delete#############################
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Full Name',
              // text: user.name,
              controller: nameController,
              onChanged: (name) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Email',
              // text: user.email,
              controller: emailController,
              onChanged: (email) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Password',
              // text: user.password,
              controller: passwordController,
              onChanged: (password) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'lastname',
              //text: user.about,
              controller: lastnameController,
              maxLines: 5,
              onChanged: (about) {},
            ),
          ],
        ),
      );
}
