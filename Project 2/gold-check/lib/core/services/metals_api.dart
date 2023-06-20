import 'dart:convert';

import 'package:goldcheck/core/exceptions/api_exception.dart';
import 'package:goldcheck/core/services/services_constace.dart';
import 'package:goldcheck/core/utls/methods/rate_dates.dart';
import 'package:http/http.dart' as http;

import '../../model/rate_point_model.dart';
import '../../model/metals_price_model.dart';

class MetalsAPI{

 Future<GoldPriceModel> getGoldPrice()async{

   try{
    
    http.Response response = await http.get(Uri
    .parse('https://www.goldapi.io/api/XAU/USD'),
    headers: requestHeaders
    );

   Map<String,dynamic> jsonResponseData = json.decode(response.body);

    if(jsonResponseData.containsKey('error')){

     print(jsonResponseData['error']);
     throw APIException(jsonResponseData["error"]);

    }
    
  return await GoldPriceModelFactory().fromJsonToGoldPriceModel(jsonResponseData);

 }catch(e){
    print(e);
   throw APIException('No data available try again later');

 }

 }

 Future<SilverPriceModel> getSilverPrice()async{

  Map<String,String> requestHeaders = {
   'Content-type': 'application/json',
   "x-access-token":metalsAPIKey
  };

  try{

   http.Response response=  await http.get(Uri
       .parse('https://www.goldapi.io/api/XAG/USD'),
       headers: requestHeaders
   );

   Map<String,dynamic> jsonResponseData = json.decode(response.body);

   if(jsonResponseData.containsKey('error')){

    print(jsonResponseData['error']);
    throw APIException(jsonResponseData["error"]);

   }

   return await SilverPriceModelFactory().fromJsonToSilverPriceModel(jsonResponseData);

  }catch(e){
   print(e);
   throw APIException('No data available try again later');

  }

 }
 

 Future<List<RatePointModel>> getGoldPoints(List<String> dates)async{

  List<RatePointModel> ratePoints=[];
  double xPoint=0.0;


  try{

   for(int i=0;i<dates.length;i++){

    http.Response response=  await http.get(Uri
        .parse('https://www.goldapi.io/api/XAU/USD/${dates[i]}'),
        headers: requestHeaders
    );

    Map<String,dynamic> jsonResponseData = json.decode(response.body);

    if(jsonResponseData.containsKey('error')){

     print(jsonResponseData['error']);
     throw APIException(jsonResponseData["error"]);

    }

    ratePoints.add(RatePointModel(pointX: xPoint, pointY: jsonResponseData["price_gram_24k"] as double));
    xPoint=xPoint+5.0;

   }

   return ratePoints;

  }catch(e){
   print(e);
   throw APIException('No data available try again later');

  }

 }

 Future<List<RatePointModel>> getSilverPoints(List<String> dates)async{

  List<RatePointModel> ratePoints=[];
  double xPoint=0.0;


  try{

   for(int i=0;i<dates.length;i++){

    http.Response response=  await http.get(Uri
        .parse('https://www.goldapi.io/api/XAG/USD/${dates[i]}'),
        headers: requestHeaders
    );

    Map<String,dynamic> jsonResponseData = json.decode(response.body);

    if(jsonResponseData.containsKey('error')){

     print(jsonResponseData['error']);
     throw APIException(jsonResponseData["error"]);

    }

    ratePoints.add(RatePointModel(pointX: xPoint, pointY: jsonResponseData["price_gram_24k"] as double));
    xPoint=xPoint+5.0;

   }

   return ratePoints;

  }catch(e){
   print(e);
   throw APIException('No data available try again later');

  }

 }


}