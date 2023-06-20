


class FormulaForSilver {


  late double fineness;
  double densityOfSilver=10.49;

  double formulaForFineness(String w1, String w2, String d) {

    fineness= (1 - (double.parse(w2) /double.parse(w1))) * (densityOfSilver / 10.49);

    return fineness * 1000;
  }

  double formulaForPurity(String w1, double fineness) {
    double result = (fineness / 1000) * double.parse(w1);
    return result;
  }

  double formulaForPercentage(double fineness) {

    return (fineness / 1000) * 100;
  }

  double priceForSilverSample(String w1,double fineness,double marketPricePerGram){

    double wightOfSample=double.parse(w1);
    double pricePerGram = (fineness * marketPricePerGram) / 1000 ;
    double totalPrice = pricePerGram * wightOfSample;

    return double.parse(totalPrice.toStringAsFixed(3)) ;

  }
}