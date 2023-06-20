import 'package:flutter/material.dart';

class CustomToggleButton extends StatelessWidget {

   CustomToggleButton({Key? key,
     this.isLeft=true,
     this.right='S',
     this.left='G',
     required this.function,
     this.height=30,this.width=80
   }) : super(key: key);

   double height ;
   double width;
   String right;
   String left;
   bool isLeft;
   Function function;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      height:height ,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).primaryColorDark
      ),
      child: InkWell(child: buttonDirectionStyle(context),onTap: (){
        function();
      },),
    );
  }

 Widget buttonDirectionStyle(context){

    if(isLeft){
     return Row(children: [
        Expanded(
          child: Container(
              alignment: Alignment.center,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Theme.of(context).primaryColor
              ),
              child: Text(left,style: TextStyle(color: Theme.of(context).primaryColorDark,
                  fontSize:15,
                  fontWeight: FontWeight.bold
              ))
          ),
        ),
        Expanded(
          child: Container(
              alignment: Alignment.center,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Theme.of(context).primaryColorDark
              ),
              child: Text(right,style: TextStyle(color: Theme.of(context).primaryColorLight,
                  fontSize:15,
                  fontWeight: FontWeight.bold
              ),)
          ),
        )
      ],);
    }else{
      return Row(children: [
        Expanded(
          child: Container(
              alignment: Alignment.center,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Theme.of(context).primaryColorDark
              ),
              child: Text(left,style: TextStyle(color: Theme.of(context).primaryColorLight,
                  fontSize:15,
                  fontWeight: FontWeight.bold
              ))
          ),
        ),
        Expanded(
          child: Container(
              alignment: Alignment.center,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Theme.of(context).primaryColor
              ),
              child: Text(right,style: TextStyle(color: Theme.of(context).primaryColorDark,
                  fontSize:15,
                  fontWeight: FontWeight.bold
              ),)
          ),
        )
      ],);

    }



 }
}
