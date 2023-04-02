import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notepad_firebase/utils/routes/route_names.dart';
import 'package:notepad_firebase/utils/utils.dart';
import 'package:provider/provider.dart';

import '../resources/components/reuseable.dart';
import 'add_note.dart';
import 'note_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final auth = FirebaseAuth.instance;

  final firestore = FirebaseFirestore.instance.collection('notes').snapshots();
  CollectionReference ref = FirebaseFirestore.instance.collection('notes');
  TextEditingController searchcontroller = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff6699cc),
        appBar: AppBar(
          flexibleSpace: Container(
            decoration:  BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.lightBlueAccent, Colors.blue.shade900],
              ),
            ),
          ),
          title:  const Text('Notepad', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
          actions: [
            IconButton(onPressed: (){
              auth.signOut();
              Navigator.pushReplacementNamed(context, RouteNames.login);
            }, icon: Icon(Icons.logout))
            // Consumer(builder: (context, value, child){
            //   return PopupMenuButton(
            //       icon: Icon(Icons.more_vert),
            //       itemBuilder: (context)=>[
            //
            //         const PopupMenuItem(
            //             enabled: false,
            //             value: 1,
            //             child: Text('Theme Mode', style: TextStyle(color: Colors.black),)),
            //
            //         PopupMenuItem(
            //             enabled: themechanger.enabled ? true : false,
            //             onTap: (){
            //               themechanger.setTheme(ThemeMode.dark);
            //               themechanger.setenable(false);
            //
            //             },
            //             value: 2,
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: const [
            //                 Text('Dark Mode'),
            //                 Icon(Icons.dark_mode),
            //
            //               ],
            //             )),
            //         PopupMenuItem(
            //             enabled: themechanger.enabled ? false : true,
            //
            //             value: 3,
            //             onTap: (){
            //               themechanger.setTheme(ThemeMode.light);
            //               themechanger.setenable(true);
            //
            //             },
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: const [
            //                 Text('Light Mode'),
            //                 Icon(Icons.light_mode),
            //               ],
            //             )),
            //         PopupMenuItem(
            //             value: 4,
            //             onTap: (){
            //               themechanger.setTheme(ThemeMode.system);
            //             },
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //
            //               children: const [
            //                 Text('System Mode'),
            //                 Icon(Icons.dark_mode),
            //
            //               ],
            //             )),
            //       ]);
            //
            // }),



          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column (
              mainAxisAlignment:MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Container(
                    height: 40,
                    child: TextFormField(
                      style: TextStyle(color: Colors.black),
                      onChanged: (value){
                        setState(() {

                        });
                      },
                      controller: searchcontroller,

                      decoration:  InputDecoration(
                          fillColor: Colors.grey.shade300,
                          filled: true,
                          contentPadding: const EdgeInsets.all(10),
                          prefixIcon: const Icon(Icons.search, color: Colors.black,),
                          hintText: 'Search Notes',
                          hintStyle: TextStyle(color: Colors.black),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.grey.shade300
                              ),
                              borderRadius: BorderRadius.circular(30)
                          ),
                          enabledBorder  : OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.grey.shade300
                              ),
                              borderRadius: BorderRadius.circular(30)
                          )


                      ),
                    ),
                  ),
                ),

                StreamBuilder<QuerySnapshot>(
                  stream: firestore,
                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){

                      if(snapshot.connectionState == ConnectionState.waiting){
                      return CircularProgressIndicator();
                      }
                        return Expanded(
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: SingleChildScrollView(
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  reverse: true,
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (context, index){

                                    String title = snapshot.data!.docs[index]['title'].toString();
                                    String des = snapshot.data!.docs[index]['description'].toString();
                                    String time = snapshot.data!.docs[index]['time'].toString();
                                    String image = snapshot.data!.docs[index]['image'].toString();

                                    String all = title + des;
                                    var id = snapshot.data!.docs[index]['id'];
                                    if(searchcontroller.text.isEmpty)
                                    {
                                      return InkWell(
                                        onTap: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(builder: (context) =>
                                                  Note_screen(id:id,
                                                    time: time,
                                                    description: des,
                                                    title: title,
                                                    image: image,
                                                    idForNotf: index, ondel: () {
                                                      ref.doc(snapshot.data!.docs[index]['id']).delete();
                                                    },
                                                  )
                                              )
                                          );
                                        },
                                        child: Reusable(
                                          id: id!,
                                          title: title,
                                          time: time,
                                          description: des,
                                          image: image, onslide: (direction)
                                        {
                                          ref.doc(snapshot.data!.docs[index]['id'].toString()).delete();
                                          Utils.toastMessage('Deleted');
                                          },),
                                      );

                                    }else if (all.toLowerCase().contains(searchcontroller.text.toLowerCase())){
                                      return InkWell(
                                        onTap: () {
                                          Navigator.pushReplacement(context,
                                              MaterialPageRoute(builder: (context) =>
                                                  Note_screen(id:id,
                                                    time: time,
                                                    description: des,
                                                    title: title,
                                                    idForNotf: index,
                                                    image: image, ondel: () {
                                                      ref.doc(snapshot.data!.docs[index]['id']).delete();
                                                      Utils.toastMessage("Deleted");
                                                      Navigator.pushReplacementNamed(context, RouteNames.Home);
                                                    }, )));
                                        },
                                        child: Reusable(
                                          id: id!,
                                          title: title,
                                          time: time,
                                          description: des,
                                          image: image,
                                          onslide: (direction) {
                                            ref.doc(snapshot.data!.docs[index]['id']).delete();
                                        },),
                                      );
                                    }

                                    return Container();

                                  }),
                            ),
                          ),
                        );



                    })

              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddNote()));
          },
          backgroundColor: Colors.blue.shade800,
          child: Icon(Icons.add, size: 40,
          ),
        )
    );
  }
}
