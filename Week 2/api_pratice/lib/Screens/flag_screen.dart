import 'package:api_pratice/model/WorldDataModel.dart';
import 'package:api_pratice/services/states_services.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'Details.dart';

class Flag extends StatefulWidget {
  const Flag({Key? key}) : super(key: key);

  @override
  State<Flag> createState() => _FlagState();
}

class _FlagState extends State<Flag> {
  TextEditingController searchController = TextEditingController();

  Widget build(BuildContext context) {
    StateServices stateServices = StateServices();
    return Scaffold(
     backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0,bottom: 30),
                child: TextFormField(

                  onChanged: (value) {
                    setState(() {});
                  },

                  controller: searchController,
                  decoration: InputDecoration(

                      prefixIcon: Icon(Icons.search),
                      contentPadding: EdgeInsets.symmetric(horizontal: 40,vertical: 20),
                      hintText: 'Search with country name',
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              width: 2, color: Colors.blue)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              width: 2, color: Colors.blue.shade900))),
                ),
              ),
              Expanded(
                child: FutureBuilder(
                  future: stateServices.WorldStatesRecord(),
                  builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                    if (!snapshot.hasData) {
                      return ListView.builder(

                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Shimmer.fromColors(
                              baseColor: Colors.grey.shade700,
                              highlightColor: Colors.grey.shade100,
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Container(
                                        height: 10,
                                        width: 90,
                                        color: Colors.white),
                                    subtitle: Container(
                                        height: 10,
                                        width: 90,
                                        color: Colors.white),

                                    leading: Container(
                                        height: 10,
                                        width: 90,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            );
                          });
                    } else {
                      return ListView.builder(
                        // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        //   crossAxisCount: 2,
                        //   crossAxisSpacing: 10
                        // ),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            String name = snapshot.data![index]['name'];
                            if (searchController.text.isEmpty) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20.0,left: 10, right: 10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.blue.shade300,
                                          borderRadius: BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 10,
                                                color: Colors.blue.shade900)
                                          ]),
                                      child: ListTile(
                                        title:
                                        Text(snapshot.data![index]['name']),
                                        leading: Image(
                                          height: 45,
                                          width: 45,
                                          image: NetworkImage(snapshot
                                              .data![index]['flags']['png']),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailsScreen(
                                                        image:
                                                        snapshot.data![index]
                                                        ['flags']['png'],
                                                        name: snapshot
                                                            .data![index]['name'],
                                                        capital:
                                                        snapshot.data![index]
                                                        ['capital'],
                                                        time:
                                                        snapshot.data![index]
                                                        ['timezones'][0],
                                                        currencies:
                                                        snapshot.data![index]
                                                        ['currencies']
                                                        [0]['name'],
                                                        languages:
                                                        snapshot.data![index]
                                                        ['languages']
                                                        [0]['name'],
                                                        population: snapshot
                                                            .data![index]
                                                        ['population']
                                                            .toString(),
                                                        area: snapshot
                                                            .data![index]['area']
                                                            .toString(),
                                                        native: snapshot
                                                            .data![index]
                                                        ['nativeName']
                                                            .toString(),
                                                        region:
                                                        snapshot.data![index]
                                                        ['region'],
                                                        subregion:
                                                        snapshot.data![index]
                                                        ['subregion'],
                                                        callingcode: snapshot
                                                            .data![index]
                                                        ['callingCodes']
                                                        [0]
                                                            .toString(),
                                                        lat: snapshot.data![index]
                                                        ['latlng'][0]
                                                            .toString(),
                                                        lang: snapshot
                                                            .data![index]
                                                        ['latlng'][1]
                                                            .toString(),
                                                      )));
                                        },
                                      ),
                                    ),
                                  ),

                                ],
                              );
                            } else if (name.toLowerCase().contains(searchController.text.toLowerCase())) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20.0, left: 10, right: 10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius: BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 10,
                                                color: Colors.blue.shade900)
                                          ]),
                                      child: ListTile(
                                        title:
                                        Text(snapshot.data![index]['name']),
                                        leading: Image(
                                          height: 45,
                                          width: 45,
                                          image: NetworkImage(snapshot.data![index]
                                          ['flags']['png']),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => DetailsScreen(
                                                    image: snapshot.data![index]['flags']['png'],
                                                    name: snapshot.data![index]['name'],
                                                    capital: snapshot.data![index]['capital'],
                                                    time: snapshot.data![index]['timezones'][0],
                                                    currencies: snapshot.data![index]['currencies'][0]['name'],
                                                    languages: snapshot.data![index]['languages'][0]['name'],
                                                    population: snapshot.data![index]['population'].toString(),
                                                    area: snapshot.data![index]['area'].toString(),
                                                    native: snapshot.data![index]['nativeName'].toString(),
                                                    region: snapshot.data![index]['region'],
                                                    subregion: snapshot.data![index]['subregion'],
                                                    callingcode: snapshot.data![index]['callingCodes'][0].toString(),
                                                    lat: snapshot.data![index]['latlng'][0].toString(),
                                                    lang: snapshot.data![index]['latlng'][1].toString(),

                                                  )
                                              ));
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              );
                            } else {
                              return Container(

                              );
                            }
                          });
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
