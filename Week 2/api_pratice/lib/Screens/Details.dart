import 'package:api_pratice/services/states_services.dart';
import 'package:flutter/material.dart';

import 'flag_screen.dart';

class DetailsScreen extends StatefulWidget {
  String name, image, capital, time;
  String languages, currencies, area, population, native;
  String callingcode, region, subregion, lat, lang;

  DetailsScreen({
    required this.name,
    required this.image,
    required this.capital,
    required this.time,
    required this.currencies,
    required this.languages,
    required this.area,
    required this.population,
    required this.native,
    required this.callingcode,
    required this.region,
    required this.subregion,
    required this.lat,
    required this.lang,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    StateServices stateServices = StateServices();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(widget.name),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 100,
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 15,
                  )
                ]),
                child: Image(image: NetworkImage(widget.image)),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    widget.name,
                    style: TextStyle(fontSize: 25),
                  )),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .005,
                    left: 15,
                    right: 15),
                child: Column(
                  children: [
                    Divider(
                      thickness: 3,
                    ),
                    reUseable_row(
                      title: 'Capital',
                      value: widget.capital.toString(),
                      icon: Icons.location_city,
                    ),
                    Divider(
                      thickness: 3,
                    ),
                    reUseable_row(
                      title: 'Currencies',
                      value: widget.currencies.toString(),
                      icon: Icons.attach_money,
                    ),
                    Divider(
                      thickness: 3,
                    ),
                    reUseable_row(
                        title: 'Time Zone',
                        value: widget.time,
                        icon: Icons.schedule),
                    Divider(
                      thickness: 3,
                    ),
                    reUseable_row(
                      title: 'Languages',
                      value: widget.languages.toString(),
                      icon: Icons.language,
                    ),
                    Divider(
                      thickness: 3,
                    ),
                    reUseable_row(
                      title: 'Population',
                      value: widget.population,
                      icon: Icons.group,
                    ),
                    const Divider(
                      thickness: 3,
                    ),
                    reUseable_row(
                      title: 'Area',
                      value: widget.area,
                      icon: Icons.public,
                    ),
                    Divider(
                      thickness: 3,
                    ),
                    reUseable_row(
                      title: 'Calling Code',
                      value: widget.callingcode,
                      icon: Icons.phone,
                    ),
                    Divider(
                      thickness: 3,
                    ),
                    reUseable_row(
                      title: 'Region',
                      value: widget.region,
                      icon: Icons.south_america,
                    ),
                    Divider(
                      thickness: 3,
                    ),
                    reUseable_row(
                      title: 'Sub Region',
                      value: widget.subregion,
                      icon: Icons.south_america,
                    ),
                    Divider(
                      thickness: 3,
                    ),
                    reUseable_row(
                      title: 'Lat-Lng',
                      value: widget.lat,
                      icon: Icons.open_in_full,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.028),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(widget.lang,
                            style: TextStyle(
                              fontSize: 15,
                            )),
                      ),
                    ),
                    Divider(
                      thickness: 3,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class reUseable_row extends StatelessWidget {
  String title, value;
  IconData icon;

  reUseable_row(
      {Key? key, required this.title, required this.value, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    Icon(icon),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(width: MediaQuery.of(context).size.width* 0.15 ,),
              Container(
                child: Text(
                  value,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
