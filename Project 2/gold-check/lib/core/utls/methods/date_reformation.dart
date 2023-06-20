
String reformatDate(DateTime dateTime){

  String dateTimeDay= dateTime.day > 10 ? dateTime.day.toString():"0${dateTime.day}" ;
  String dateTimeMonth=dateTime.month > 10 ? dateTime.month.toString():"0${dateTime.month}";

  return "${dateTime.year}$dateTimeMonth$dateTimeDay";

}