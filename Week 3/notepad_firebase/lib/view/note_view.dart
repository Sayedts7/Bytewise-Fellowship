import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:notepad_firebase/utils/routes/route_names.dart';
import 'package:notepad_firebase/utils/utils.dart';
import 'package:notepad_firebase/view/share.dart';

class Note_screen extends StatefulWidget {
  final int  idForNotf;
  VoidCallback ondel;

  final String title, description, time, id, image;
  Note_screen({Key? key,
    required this.idForNotf,
    required this.id,
    required this.image,
    required this.time,
    required this.description,
    required this.ondel,
    required this.title})
      : super(key: key);

  @override
  State<Note_screen> createState() => _Note_screenState();
}

class _Note_screenState extends State<Note_screen> {
  String now = DateFormat.yMMMMd().add_Hms().format(DateTime.now());
  DateTime selectedDate = DateTime.now();
  DateTime fullDate = DateTime.now();

  final auth = FirebaseAuth.instance;

  final firestore = FirebaseFirestore.instance.collection('notes').snapshots();
  CollectionReference ref = FirebaseFirestore.instance.collection('notes');

  var id = DateTime.now().millisecondsSinceEpoch.toString();
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();

  late bool save;
  @override

  File? _image;
  var pickedFile;
  final picker = ImagePicker();
  Future getGalleryImage()async{
    pickedFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    setState(() {
      if(pickedFile != null){

        _image = File(pickedFile.path);
      }else{
        print('No image selected');
      }
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titlecontroller.text = widget.title;
    print(titlecontroller);

    descriptioncontroller.text = widget.description;
    print(descriptioncontroller);
    save = true;

  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note'),
        actions: [
          titlecontroller.text.isEmpty   && descriptioncontroller.text.isEmpty ?
          Icon(Icons.share, color: Colors.grey.shade700,) :
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Screenshot_Share(
              title: widget.title, des: widget.description, image: widget.image ,)));
          }, icon: const Icon(Icons.share)) ,


          save  ?
          IconButton(onPressed: widget.ondel,

            icon: const Icon(Icons.delete),)
              :
          IconButton(onPressed: (){
           ref.doc(widget.id).update({
             'title' : titlecontroller.text.toString(),
             'description': descriptioncontroller.text.toString(),
             'time' : now,

           }
           ).then((value) {
             Utils.toastMessage('updated');
             Navigator.pushReplacementNamed(context, RouteNames.Home);

           });
          },//widget.onupdate,
            icon: const Icon(Icons.save_alt),)
        ],
      ),
      // bottomNavigationBar: BottomAppBar(
      //   child: Container(
      //     width: MediaQuery.of(context).size.width * 1,
      //     height: MediaQuery.of(context).size.height * 0.1,
      //     color: Colors.grey.shade300,
      //     child: Center(
      //       child: IconButton(
      //         onPressed: (){
      //           _selectDate(context);
      //         }, icon: Icon(Icons.add_alert,color: Colors.green,),
      //       ),
      //     ),
      //   ),
      // ),

      body: SingleChildScrollView(
        child: SafeArea(
          child:  Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    children: [
                      Text(widget.time, style: const TextStyle(fontSize: 15, color: Colors.white),),
                      Text('')
                    ],
                  ),
                ),

                TextFormField(
                  onTap: (){
                    setState(() {
                      save = false;
                    });
                  },
                  controller: titlecontroller,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  // initialValue: widget.title,
                  minLines: 1,
                  maxLines: 10000,

                  decoration: const InputDecoration(
                      hintText: 'title',
                      hintStyle: TextStyle(fontSize: 20, color: Colors.white70,fontWeight: FontWeight.bold),
                      border: InputBorder.none
                  ),
                ),
                const Divider(),
                TextFormField(
                  controller: descriptioncontroller,
                  onTap: (){
                    setState(() {
                      save = false;
                    });
                  },

                  minLines: 1,
                  maxLines: 10000,

                  //style: const TextStyle( fontWeight: FontWeight.bold),
                  //initialValue: widget.description,

                  decoration: const InputDecoration(
                      hintText: 'Note something down',
                      hintStyle: TextStyle( color: Colors.white70,),
                      border: InputBorder.none
                  ),
                ),
                // Builder(builder: (BuildContext context){
                //   return Utility.imageFromBase64String(widget.bytes);
                // }),
                const Divider(),
                InkWell(
                  onTap: (){
                    getGalleryImage();
                    setState(() {
                      save = false;
                    });
                  },
                  child: widget.image !=  '' ? Center(
                    child: SizedBox(
                      height: 400,
                      width: 400,
                      // child: Image.asset(bytes),
                      child:_image!= '' ? Image.network(widget.image) : Container(),

                      // return Utility.imageFromBase64String(photo.photoName ?? "");

                    ),
                  ) : Center(
                    child: SizedBox(
                      height: 400,
                      width: 400,

                      // child: Image.asset(bytes),
                      child:_image!= null ? Image.file(_image!.absolute) : const Icon(Icons.image),
                      // return Utility.imageFromBase64String(photo.photoName ?? "");

                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  MyHomePage()));
      //   },
      //   backgroundColor: Colors.grey,
      //   child: const Icon(Icons.add, size: 40,
      //   ),
      // )
    );
  }
}

