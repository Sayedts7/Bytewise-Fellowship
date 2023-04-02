import 'dart:io';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:notepad_firebase/utils/routes/route_names.dart';
import 'package:notepad_firebase/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';
import '../utils/utils.dart';


class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {

  final FirebaseAuth auth = FirebaseAuth.instance;
  firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;

  final firestore = FirebaseFirestore.instance.collection('notes');

  DateTime selectedDate = DateTime.now();
  DateTime fullDate = DateTime.now();
  String now = DateFormat.yMMMMd().add_Hms().format(DateTime.now());

  var id = DateTime.now().millisecondsSinceEpoch.toString();
  var image ;

  TextEditingController titlecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();

  File? _image;
  var pickedFile;
  final picker = ImagePicker();
  Future getGalleryImage()async{
    final pickedFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 10);
    setState(() {
      if(pickedFile != null){
        _image = File(pickedFile!.path);

      }else{
        print('No image selected');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Note'),
        actions: [

          IconButton(onPressed: () async{
           if(_image != null){
             firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance.ref('/notes/' + id);
             firebase_storage.UploadTask uploadtask =ref.putFile(_image!.absolute);

             await Future.value(uploadtask).then((value) async {
               var newUrl = await ref.getDownloadURL();
               firestore.doc(id).set({
                 'id': id,
                 'title': titlecontroller.text.toString(),
                 'description': descriptioncontroller.text.toString(),
                 'image' : newUrl.toString(),
                 'time' : now

               }).then((value) {

                 Utils.toastMessage('Saved');
                 Navigator.pushReplacementNamed(context, RouteNames.Home);
               }).onError((error, stackTrace) {
                 Utils.toastMessage(error.toString());
               });
             });
           }else{
              firestore.doc(id).set({
              'id': id,
              'title': titlecontroller.text.toString() ?? '',
              'description': descriptioncontroller.text.toString() ?? '',
              'image' : '',
              'time' : now

                }).then((value) {
                Utils.toastMessage('Saved');
                Navigator.pushReplacementNamed(context, RouteNames.Home);
                }).onError((error, stackTrace) {
                Utils.toastMessage(error.toString());
                });

           }

          }, icon: Icon(Icons.save_alt),),

        ],
      ),


      body: SafeArea(
        child:  SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(now, style: const TextStyle(fontSize: 15, color: Colors.white),),
                ),

                TextFormField(
                  minLines: 1,
                  maxLines: 1000,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  controller: titlecontroller,
                  decoration: const InputDecoration(
                      hintText: 'Title',
                      hintStyle: TextStyle(fontSize: 20, color: Colors.white70,fontWeight: FontWeight.bold),
                      border: InputBorder.none
                  ),
                ),

                const Divider(color: Colors.white,),

                TextFormField(
                  minLines: 1,
                  maxLines: 1000,
                  controller: descriptioncontroller,
                  decoration: const InputDecoration(
                      hintStyle: TextStyle( color: Colors.white70,),
                      hintText: 'Note something down',
                      border: InputBorder.none
                  ),
                ),
                const Divider(
                  color: Colors.white,
                ),
                InkWell(
                  onTap: (){
                     getGalleryImage();
                  },
                  child: Center(
                    child: Container(
                      height: 400,
                      width: 400,

                      // child: Image.asset(bytes),
                      child:_image!= null ? Image.file(_image!.absolute) : const Icon(Icons.image, color: Colors.white,),
                      // return Utility.imageFromBase64String(photo.photoName ?? "");

                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
