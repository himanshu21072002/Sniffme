import 'dart:math';

import 'package:flutter/material.dart';

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sniff_me/pages/storage_service.dart';

import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddPage extends StatefulWidget {

  // String userId;
  // AddPage({Key key,this.userId}) :super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}


class _AddPageState extends State<AddPage> {



  final _auth = FirebaseAuth.instance;
  File _image;
  final imagePicker=ImagePicker();
  String downloadUrl;



  Future imagePickerMethod() async{
    //picking image from galary
    final pick = await imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      if(pick!=null){
        _image=File(pick.path);
        // showSnackBar(_auth.currentUser.uid.toString(), Duration(milliseconds: 800));

        // print();
      }
      else{
        //snackbar
        showSnackBar("No File Selected", Duration(milliseconds: 800));
      }
    });


  }

  //uploading to firebase storage
  Future uploadImage() async{
    String curr_email_id=_auth.currentUser.email.toString();
    String curr_u_id=_auth.currentUser.uid.toString();

    FirebaseFirestore firebaseFirestore= FirebaseFirestore.instance;
    //upload on firebase storeage
    final postId= curr_email_id+DateTime.now().millisecondsSinceEpoch.toString();
    Reference ref= FirebaseStorage.instance.ref().child("users_uploaded_pic/${curr_email_id}_uploadedimage").child("${postId}");
    await ref.putFile(_image);
    downloadUrl=await ref.getDownloadURL();
    print(downloadUrl);
    showSnackBar("image Uploaded :)", Duration(milliseconds: 1000));

    //uploading this url to firestore
    await firebaseFirestore.collection("users").doc(curr_u_id).collection("images").add({'downloadURL': downloadUrl});
  }


  showSnackBar(String snacktext ,Duration d){
    final snackBar= SnackBar(content: Text(snacktext),duration: d);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(


    appBar: AppBar(title: Text('AddPage'),automaticallyImplyLeading: false,backgroundColor: Colors.pink),


    body: Center(
      child: Padding(
        padding: EdgeInsets.all(8),
        //for rounded rectangular clip
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: SizedBox(
            height: 500,
            width: double.infinity,

            child:Column(
              children: [
                const Text("Upload Image",style: TextStyle(fontSize: 20),),
                const SizedBox(
                  height: 10,
                ),
                Expanded(flex:4,child: Container(width: 300,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.pink )),
                  child :Center(
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Expanded(
                             child: _image==null? const Center(child: Text("No Image Selected")):

                             Image.file(_image)),
                       ],
                     ),
                )
                )
                ),
                ElevatedButton(onPressed: (){imagePickerMethod();}, child: Text("Select Image"),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black,

                     )),
                ElevatedButton(onPressed: (){
                  if(_image!=null){
                    uploadImage();
                  }
                  else{
                    showSnackBar("No Image Selected", Duration(milliseconds: 800));
                  }

                  }, child: Text("Upload Image"),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.black
                    )),


              ],
            ),
          ),
        ),
      ),
    ),


    );
  }
}
