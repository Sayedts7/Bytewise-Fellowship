
import 'package:forex_conversion/forex_conversion.dart';

Future<double> fromUSDToPKR(double priceInUSD)async{

  final fx = Forex();
  double myPriceInPKR = await fx.getCurrencyConverted("USD", "PKR", priceInUSD);
  return myPriceInPKR;

}


