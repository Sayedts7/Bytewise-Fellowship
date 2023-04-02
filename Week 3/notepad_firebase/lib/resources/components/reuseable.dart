import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Reusable extends StatelessWidget {
  DismissDirectionCallback onslide;
  final String title, time, description, image, id;
  Reusable(
      {Key? key,
      required this.id,
      required this.onslide,
      required this.image,
      required this.title,
      required this.time,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: UniqueKey(),
        onDismissed: onslide,

        background: Container(
          child: Icon(Icons.delete),
          decoration: BoxDecoration(
              color: Colors.white54, borderRadius: BorderRadius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.13,
            width: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.lightBlueAccent, Colors.blue.shade900]),
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.025,
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          title,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.020,
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          description,
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                      Text(
                        time,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: image != ''
                        ? Image(image: NetworkImage(image))
                        : Container(),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
