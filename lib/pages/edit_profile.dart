// ignore_for_file: library_private_types_in_public_api

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sniff_me/pages/storage_service.dart';
// import 'package:settings_ui/pages/settings.dart';
import 'settings.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key key}) : super(key: key);


  @override
  _EditProfilePageState createState() => _EditProfilePageState();

}

class _EditProfilePageState extends State<EditProfilePage> {



  //THis is for initialising the parameteres
  File pickedImage;
  final Storage storage= Storage();
  final _auth = FirebaseAuth.instance;

  File _image;




  void imagePickerOption() {
    Get.bottomSheet(
      SingleChildScrollView(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: Container(
            color: Colors.white,
            height: 250,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(

                    "Update Profile Image ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      pickImage(ImageSource.camera);
                    },
                    icon: const Icon(Icons.camera),
                    label: const Text("CAMERA"),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      pickImage(ImageSource.gallery);
                    },
                    icon: const Icon(Icons.image),
                    label: const Text("GALLERY"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close),
                    label: const Text("CANCEL"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }




  pickImage(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        pickedImage = tempImage;
        storage.uploadFile(pickedImage.path,'${_auth.currentUser.email}_profile').then((value) => print('done'));

      });

      Get.back();
    } catch (error) {
      debugPrint(error.toString());
    }
  }







  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    return Scaffold(

      appBar: AppBar(
        title: const Text('My Profile'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.pink,

        elevation: 1,

        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [

              Container(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,

                    ),
                    ////////////////////// THIS IS FOR EDIT ICON BELOW PROFILE IMAGE
                    Positioned(
                      bottom: 10,
                       left: 120,

                        child: Container(


                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: Color(0xFF186CDE),

                          ),
                          child: ElevatedButton.icon(

                            icon: const Icon(Icons.edit),
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),

                              padding: EdgeInsets.all(10),
                            ),
                           /////EDIT BUTTON ONCLICKED
                           onPressed: imagePickerOption,
                            label: const Text(""),

                            // Icons.edit,
                            // color: Colors.white,

                          ),

                        )

                    ),
                    //FUTURE BUILDER

                    ////////////////////////////////////////////////////////////////////////////////////
                    FutureBuilder(
                      future: storage.downloadURL('${_auth.currentUser.email.toString()}_profile'),

                      builder: (BuildContext context ,
                      AsyncSnapshot<String> snapshot){
                        print("jjjjjjjjj"+_auth.currentUser.displayName.toString());
                          if(snapshot.connectionState== ConnectionState.done && snapshot.hasData
                              && snapshot.hasData){
                            return Container(
                              width: 130,
                              height: 130,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 4,
                                      color: Theme.of(context).scaffoldBackgroundColor),
                                  boxShadow: [
                                    BoxShadow(
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                        color: Colors.black.withOpacity(0.1),
                                        offset: const Offset(0, 10))
                                  ],
                                  shape: BoxShape.circle,

                                  image:  DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                      pickedImage!=null ?

                                        FileImage(File(pickedImage.path))
                                          :
                                      NetworkImage(

                                          snapshot.data,
                                          // "https://qph.cf2.quoracdn.net/main-thumb-938329017-200-owmqgmbwjaswizxvffyarqlnvpfsiwwk.jpeg"
                                        // "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                                      )
                                )
                              ),




                              // child: Image.network(
                              //   snapshot.data,
                              //   fit: BoxFit.cover,
                              // ),
                            );
                          }
                          if(snapshot.connectionState== ConnectionState.waiting || !snapshot.hasData){
                            return CircularProgressIndicator();
                          }
                          return Container();
                      }

                    )




                  ],
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              //////////////////////////////////deelte
              StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance.collection("users").doc(_auth.currentUser.uid.toString()).snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return LinearProgressIndicator();

                  return Text( snapshot.data['firstName']);
                },
              ),
              ///////////////////////dele

              // buildTextField("E-mail", "atharvabhanage1@gmail.com", false),

              // buildTextField("Location", "Goa, India", false),
              const SizedBox(
                height: 35,
              ),
              ///////////////////////////////////////////////
              StreamBuilder(

                stream: FirebaseFirestore.instance.collection("users").doc(_auth.currentUser.uid.toString()).collection("images").snapshots(),
                builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){


                  if(!snapshot.hasData){
                    return (const Center(child: Text("No Image Uplaoded")));

                  }
                  else{
                    return SizedBox(
                      height: height*0.55,
                      child: GridView.builder(itemCount: snapshot.data.docs.length,

                          gridDelegate:
                           const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 2,
                            crossAxisSpacing: 2,
                            childAspectRatio: 0.75,
                          ),
                          itemBuilder: (BuildContext context,int index) {
                            String url = snapshot.data.docs[index]['downloadURL'];
                            return Image.network(url,
                                height: 300,
                                fit: BoxFit.cover);

                          } ),
                    );

                  }

                },
              )

            ],
          ),

        ),





      ),




    );
  }


  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        enabled: false,
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
              onPressed: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              icon: const Icon(
                Icons.remove_red_eye,
                color: Colors.grey,
              ),
            )
                : null,
            contentPadding: const EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}