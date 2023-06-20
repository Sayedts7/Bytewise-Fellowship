

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:goldcheck/core/exceptions/api_exception.dart';
import 'package:goldcheck/core/utls/app_constane.dart';
import 'package:goldcheck/model/data_state.dart';
import 'package:goldcheck/core/utls/methods/rate_dates.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/services/metals_api.dart';
import '../core/utls/methods/date_reformation.dart';
import '../model/metals_price_model.dart';
import '../model/rate_point_model.dart';

class HomeViewModel extends ChangeNotifier{

  double goldPrinceInUSD=0.0;
  double goldPrinceInPKR=0.0;
  double silverPrinceInUSD=0.0;
  double silverPrinceInPKR=0.0;

  List<RatePointModel> goldPoints=[];
  List<RatePointModel> silverPoints=[];
  List<String> goldDates=[];
  List<String> silverDates=[];

  late BuildContext buildContext;
  late DataState dataState;

  HomeViewModel(BuildContext context){

    dataState=DataState.loading;
    buildContext=context;

    print("in homeVM");
    _initHomeScreenData();

  }

  Future<void> getGoldPrice()async{

    try{

      GoldPriceModel goldPriceModel=await MetalsAPI().getGoldPrice();
    goldPrinceInUSD = goldPriceModel.goldPrinceInUSD;
    goldPrinceInPKR = goldPriceModel.goldPrinceInPKR;

    } on APIException catch(e){
      
      print(e.errorMessage);
      dataState=DataState.error;
      notifyListeners();
      throw APIException(e.errorMessage);

    }
  }

  Future<void> getSilverPrice()async{

    try{

      SilverPriceModel silverPriceModel=await MetalsAPI().getSilverPrice();
    silverPrinceInUSD = silverPriceModel.silverPrinceInUSD;
    silverPrinceInPKR = silverPriceModel.silverPrinceInPKR;
    } on APIException catch(e){

      print(e.errorMessage);
      dataState=DataState.error;
      notifyListeners();

      throw APIException(e.errorMessage);


    }
  }
  Future<void> getGoldPoints()async{

    try{
      goldDates=getDates();
      goldPoints=await MetalsAPI().getGoldPoints(goldDates);

      goldPoints.add(RatePointModel(pointX:(goldPoints[goldPoints.length-1].pointX)+5.0 ,pointY:goldPrinceInUSD ));
      goldDates.add(reformatDate(DateTime.now()));
    } on APIException catch(e){

      print(e.errorMessage);
      dataState=DataState.error;
      notifyListeners();

      throw APIException(e.errorMessage);


    }


  }

  Future<void> getSilverPoints()async{
    try{

    silverDates=getDates();
    silverPoints=await MetalsAPI().getSilverPoints(silverDates);

    silverPoints.add(RatePointModel(pointX:(silverPoints[silverPoints.length-1].pointX)+5.0 ,pointY:silverPrinceInUSD ));
    silverDates.add(reformatDate(DateTime.now()));

    } on APIException catch(e){

      print(e.errorMessage);
      dataState=DataState.error;
      notifyListeners();
      throw APIException(e.errorMessage);


    }
  }

  _initHomeScreenData()async{

    DateTime dateTimeNow=DateTime.now();
    final sharedPref=await SharedPreferences.getInstance();
    String? savedDate=sharedPref.getString(savedDateKey);


    if(savedDate==null){

      _callHomeViewModelRemoteMethods();

    }else if(_isNotTheSameDay(dateTimeNow,DateTime.parse(savedDate)) ){
       print('new day');
      _callHomeViewModelRemoteMethods();


    }else{

      if(dateTimeNow.difference(DateTime.parse(savedDate)).inHours >= 6){

         print('updatePrice');
        _updatePrice();

      }else{
       print('get Cashed Data');

       try{

         _getOfflineData().then((value){

          dataState=DataState.success;
          notifyListeners();

        });

       }catch(e){

         print(e);
         dataState=DataState.loading;
         notifyListeners();

         _callHomeViewModelRemoteMethods();
       }

      }

    }

  }

  _callHomeViewModelRemoteMethods()async{

    print('in callHomeViewModelMethods()');


    try{

      getGoldPrice().then((value)async{

        await getGoldPoints().then((value){

          getSilverPrice().then((value)async{

            getSilverPoints().then((value){

              print(dataState);
              print('finish silver points');


              _saveOfflineData().then((value){

                dataState=DataState.success;
                notifyListeners();

              });


            });
          });

        });

      });


    }on APIException catch(e){

      print(e.errorMessage);
      dataState=DataState.error;
      notifyListeners();


    }catch (e){

      print(e);
      dataState=DataState.error;
      notifyListeners();

    }

  }

  bool _isNotTheSameDay(DateTime nowTime,DateTime savedDate){

    return (savedDate.day != nowTime.day) || (savedDate.month != nowTime.month) || (savedDate.year != nowTime.year) ;
  }


  _updatePrice(){
    try{

      getGoldPrice().then((value){

        getSilverPrice().then((value) {

          _saveOfflinePriceOnly().then((value){

            _getOfflineData().then((value) {

              dataState=DataState.success;
              notifyListeners();

            });
          });
        });
      });


    }catch(e){

      print(e);
      dataState=DataState.loading;
      notifyListeners();

      _callHomeViewModelRemoteMethods();

    }
  }

 Future<void> _saveOfflinePriceOnly()async{

    final sharedPref= await SharedPreferences.getInstance();


    Map<String,double> goldPrice={goldPriceInUSDKey:goldPrinceInUSD,goldPrinceInPKRKey:goldPrinceInPKR};
    Map<String,double> silverPrice={silverPriceInUSDKey:silverPrinceInUSD,silverPrinceInPKRKey:silverPrinceInPKR};

    sharedPref.setString(goldPriceKey, jsonEncode(goldPrice));
    sharedPref.setString(silverPriceKey, jsonEncode(silverPrice));

    sharedPref.setString(savedDateKey,"${DateTime.now()}");

  }

  Future<void> _saveOfflineData()async {

    print('in saveOfflineData');

    try {
      final sharedPref = await SharedPreferences.getInstance();
      Map<String, double> goldPointsInJson = {};
      Map<String, double> silverPointsInJson = {};

      Map<String, double> goldPrice = {
        goldPriceInUSDKey: goldPrinceInUSD,
        goldPrinceInPKRKey: goldPrinceInPKR
      };
      Map<String, double> silverPrice = {
        silverPriceInUSDKey: silverPrinceInUSD,
        silverPrinceInPKRKey: silverPrinceInPKR
      };

      goldPoints.forEach((element) {
        print('in save offine data goldPoints loop');
        print('${element.pointX}:${element.pointY} gold');

        goldPointsInJson['${element.pointX}'] = element.pointY;
      });

      silverPoints.forEach((element) {

        print('in save offine data silver loop');
        print('${element.pointX}:${element.pointY} silver');

        silverPointsInJson['${element.pointX}'] = element.pointY;
      });


      sharedPref.setString(goldPriceKey, jsonEncode(goldPrice));
      sharedPref.setString(silverPriceKey, jsonEncode(silverPrice));
      print('in save offine data jsonEncode(goldPointsInJson)');
      sharedPref.setString(goldPointsKey, jsonEncode(goldPointsInJson));
      print('in save offine data jsonEncode(silverPointsInJson)');
      sharedPref.setString(silverPointsKey, jsonEncode(silverPointsInJson));

      sharedPref.setString(goldDatesKey,goldDates.join(' '));
      print("$goldDates gold dates");
      sharedPref.setString(silverDatesKey,silverDates.join(' '));

      sharedPref.setString(savedDateKey,"${DateTime.now()}");

      print('${DateTime.now()} DateTime.now()');

      print('save offlined data finished');

    }catch (e){
      print(e);
      throw Exception(e);
    }
  }

  Future<void> _getOfflineData()async {

    try{

    final sharedPref = await SharedPreferences.getInstance();

    Map<String, dynamic> goldPrice = jsonDecode(
        sharedPref.getString(goldPriceKey) ?? "{}");
    Map<String, dynamic> silverPrice = jsonDecode(
        sharedPref.getString(silverPriceKey) ?? "{}");

    Map<String, dynamic> goldPoints = jsonDecode(
        sharedPref.getString(goldPointsKey) ?? "{}");
    Map<String, dynamic> silverPoints = jsonDecode(
        sharedPref.getString(silverPointsKey) ?? "{}");

    goldPrinceInUSD = goldPrice[goldPriceInUSDKey] ?? 0.0;
    goldPrinceInPKR = goldPrice[goldPrinceInPKRKey] ?? 0.0;

    silverPrinceInUSD = silverPrice[silverPriceInUSDKey] ?? 0.0;
    silverPrinceInPKR = silverPrice[silverPrinceInPKRKey] ?? 0.0;

    this.goldPoints = goldPoints.entries.toList().map((e) =>
        RatePointModel(pointX: double.parse(e.key), pointY: e.value)).toList();
    this.silverPoints = silverPoints.entries.toList().map((e) =>
        RatePointModel(pointX: double.parse(e.key), pointY: e.value)).toList();

    if(goldPoints.isNotEmpty){

    this.goldPoints[(this.goldPoints.length) - 1] = RatePointModel(
        pointX: this.goldPoints[(this.goldPoints.length) - 1].pointX,
        pointY: goldPrinceInUSD);

    }


    if(silverPoints.isNotEmpty){

    this.silverPoints[(this.silverPoints.length) - 1] = RatePointModel(
        pointX: this.silverPoints[(this.goldPoints.length) - 1].pointX,
        pointY: silverPrinceInUSD);

    }

    String localGoldDates = sharedPref.getString(goldDatesKey) ?? '';
    goldDates = localGoldDates.isNotEmpty ? localGoldDates.split(' ') : [];

    String localSilverDates = sharedPref.getString(silverDatesKey) ?? '';
    silverDates = localSilverDates.isNotEmpty ? localGoldDates.split(' ') : [];

  }catch(e){

    throw Exception(e);

  }

  }



}

