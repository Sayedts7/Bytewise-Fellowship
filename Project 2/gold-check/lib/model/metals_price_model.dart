
import 'package:equatable/equatable.dart';

import '../core/utls/methods/usd_pkr_converter.dart';

class GoldPriceModel extends Equatable{

   double goldPrinceInUSD=0.0;
   double goldPrinceInPKR=0.0;

   GoldPriceModel({
    required this.goldPrinceInUSD,
    required this.goldPrinceInPKR,
  });


  @override
  List<Object?> get props => [goldPrinceInUSD,goldPrinceInPKR];

}

class GoldPriceModelFactory {

 Future<GoldPriceModel> fromJsonToGoldPriceModel(Map<dynamic,dynamic> jsonData)async{


    double goldPrinceInUSD = jsonData["price_gram_24k"] as double;
    double goldPrinceInPKR = await fromUSDToPKR(goldPrinceInUSD);

 return GoldPriceModel(

   goldPrinceInUSD: double.parse(goldPrinceInUSD.toStringAsFixed(2)),
   goldPrinceInPKR: double.parse(goldPrinceInPKR.toStringAsFixed(2))

 );

}

}

class SilverPriceModel extends Equatable{

  double silverPrinceInUSD=0.0;
  double silverPrinceInPKR=0.0;


  SilverPriceModel({
    required this.silverPrinceInUSD,
    required this.silverPrinceInPKR
  });


  @override
  List<Object?> get props => [silverPrinceInUSD,silverPrinceInPKR];

}

class SilverPriceModelFactory {

  Future<SilverPriceModel> fromJsonToSilverPriceModel(Map<dynamic,dynamic> jsonData)async{

    double silverPrinceInUSD= jsonData["price_gram_24k"] as double ;
    double silverPrinceInPKR = await fromUSDToPKR(silverPrinceInUSD);


    return SilverPriceModel(

        silverPrinceInUSD: double.parse(silverPrinceInUSD.toStringAsFixed(3)),
        silverPrinceInPKR: double.parse(silverPrinceInPKR.toStringAsFixed(2))

    );

  }

}
