import 'dart:convert';

import 'package:api_pratice/services/utilities/app_url.dart';
import 'package:http/http.dart' as http;

import '../model/WorldDataModel.dart';


class StateServices{
  Future<List<dynamic>> WorldStatesRecord () async {
    var data;
    final response = await http.get(Uri.parse(AppUrl.saraUrl));

    if(response.statusCode == 200){
       data = jsonDecode(response.body);
      return data;
    }
    else{
      throw Exception('error');
    }
  }
}
