// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import '../models/image_model.dart';

class ImageList extends StatelessWidget{

  final List<ImageModel> images;

  const ImageList(this.images, {super.key}); 

  Widget build(context){
    return ListView.builder( 
      itemCount: images.length,
      itemBuilder: (context,int index){
          return buildImage(images[index]);
      },
      );
  }
  
  Widget buildImage(ImageModel image){
    return Container(
            decoration: BoxDecoration(
              border:  Border.all(color: Color.fromARGB(255, 3, 42, 74)),
               ),
            padding: EdgeInsets.all(20.0),
            margin: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Padding(
                  child: Image.network(image.url),
                  padding: EdgeInsets.only(
                    bottom: 8.0,
                  ),
                  ),
                Text(image.title),
              ],
            ),
          );
  }
 
}