import 'package:flutter/cupertino.dart';

class FormulaForGold {

  late double w3, V, densityofGold;
  late double karat;

  double FormulaforKarat(String w1, String w2, String d) {
    // print(w1 + 'w1');
    // print(w2+ 'w2');
    // print(d+ 'd');
    w3 = double.parse(w1) - double.parse(w2);
    V = w3 / double.parse(d);
    densityofGold = double.parse(w1) / V;
    karat = (densityofGold / 19.32) * 24;
    // print(karat.toString()+ "karat1");
    return karat;
  }

  double FormulaforPurity(String w1, double karat) {
    double result = (karat / 24) * double.parse(w1);
    // print(karat.toString()+' karat');
    return result;
  }

  double Formulaforpercentage(double karat) {
    return karat / 24 * 100;
  }

  double priceForGoldSample(String w1,double karat,double marketPricePerGram){

    double wightOfSample=double.parse(w1);
    double pricePerGram = (karat* marketPricePerGram) / 24 ;
    double totalPrice = pricePerGram * wightOfSample;

    return double.parse(totalPrice.toStringAsFixed(2)) ;
  }
}
