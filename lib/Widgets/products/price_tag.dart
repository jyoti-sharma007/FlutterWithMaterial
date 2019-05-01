import 'package:flutter/material.dart';

class PriceTag extends StatelessWidget{

final String price;

PriceTag(this.price);

@override
Widget build(BuildContext context) {
  return Container(
             padding: EdgeInsets.symmetric(horizontal:10.0,vertical:7.0),
             decoration: BoxDecoration(color:Colors.cyan),
             child: Text(
              '\$$price',
              style:TextStyle(fontSize: 26.0, fontWeight: FontWeight.w200,color:Colors.white),
            ),

  );
}
}