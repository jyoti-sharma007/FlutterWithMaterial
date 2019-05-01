import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget{
@override
State<StatefulWidget>createState() {
 return _ImageInputState();
        }
}

class _ImageInputState extends State<ImageInput> {
File _imageFile;

  void _getImage(BuildContext context,ImageSource source) {
    ImagePicker.pickImage(source:  source,maxWidth: 500.0).then((File image){
      setState(() {
        _imageFile = image;
      });

    Navigator.pop(context);
    } );
  }
  void _openImagePicker (BuildContext context){
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
      return Container(
        height: 160.0,
        padding: EdgeInsets.all(10.0),
        child: Column(children:[
        Text('Pick A Image',style: TextStyle(fontWeight: FontWeight.bold),),
        SizedBox( height: 10.0,
        ),
        FlatButton(
          textColor: Theme.of(context).primaryColor,
          child: Text('Use Camera'),
         onPressed : () {
          _getImage(context, ImageSource.camera);
         },
        ),
        SizedBox( height: 10.0,
        ),
        FlatButton(
          textColor: Theme.of(context).primaryColor,
          child: Text('Use Gallery'),
         onPressed : () {
           _getImage(context, ImageSource.gallery);
         },
        ),
        ]
        ),
    );
  });
  }

  @override
  Widget build(BuildContext context) {
    final buttonColor =Theme.of(context).accentColor;
    return Column(
      children: <Widget>[
      OutlineButton(
        borderSide: BorderSide(
          color: buttonColor,
           width: 2.0,
        ),
        onPressed: () {
           _openImagePicker (context);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget>[
             Icon(Icons.camera_alt , color: buttonColor,),
        SizedBox(
          width:   5.0,
        ),
        Text('Add Image' ,style: TextStyle(color: buttonColor),)
      ],
      ),
      ),
      SizedBox(height: 10.0),
      _imageFile == null ? Text('Please pick an image.'): Image.file(
        _imageFile,
        fit: BoxFit.cover,
        height: 300.0,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.topCenter,
        )
    ],);
  }
  }