import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:mvvm/data/app_exceptions.dart';
import 'package:mvvm/data/network/BaseApiService.dart';
import 'package:http/http.dart' as http;
class NetworkApiService extends BaseApiService{

  @override
  Future getGetAPiResponce(String url) async{
    dynamic responseJson;
   try{
     final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
     responseJson = returnResponse(response);
   }on SocketException{
     throw FetchDataException(
       'No internet connection'
     );
   }
   return responseJson;

  }

  @override
  Future getPostApiResponse(String url, dynamic data) async{
    dynamic responseJson;
    try{

      Response response = await post(
        Uri.parse(url),
        body: data,
      ).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    }on SocketException{
      throw FetchDataException(
          'No internet connection'
      );
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response){

    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;


      case 404:
        throw UnauthorizedException(
            response.statusCode.toString()
        );
      case 400:
        throw BadRequestException(
          response.statusCode.toString()
        );
      default:
        throw FetchDataException('Error accured while communicating with server'+
            ' with status code'+ response.statusCode.toString());
    }
  }


}