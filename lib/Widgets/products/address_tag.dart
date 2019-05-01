import 'package:flutter/material.dart';

class AddressTag extends StatelessWidget{

  final String address;

  AddressTag(this.address);

  @override
  Widget build(BuildContext context) {
     return  Container(
               padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 10.0),
               decoration: BoxDecoration(
               border:Border.all(color:Colors.red,width: 2.2),
               borderRadius: BorderRadius.circular(10.0)),
              child: Text(address),
              );
               
  }
}