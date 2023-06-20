
import 'package:goldcheck/core/utls/methods/date_reformation.dart';

List<String> getDates(){

  List<String> dates=[];

  for( int i=5 ;i>=0 ;i--){

    DateTime dateTime=DateTime.now().subtract(Duration(days:i+1));
    print('get date $i loop num');
    dates.add(reformatDate(dateTime));

  }
  return dates;

}

