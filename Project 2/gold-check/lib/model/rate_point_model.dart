import 'package:equatable/equatable.dart';

class RatePointModel extends Equatable{

  double pointX;
  double pointY;

  RatePointModel({required this.pointX,required this.pointY});

  @override
  List<Object?> get props => [this.pointX,this.pointY];

}