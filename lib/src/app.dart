import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'model/image_model.dart';
import 'dart:convert';
import 'widgets/images_list.dart';

class App extends StatefulWidget{
  
  createState(){
    return AppState();
  }

}

class AppState extends State<App> {
  
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async{

    counter++;
    var reponse = await get("https://jsonplaceholder.typicode.com/photos/$counter");
    var imageModel = ImageModel.fromJson(json.decode(reponse.body));

    setState(() {
      images.add(imageModel);
    });

  }

  Widget build(context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("C'est le merdier !!!"),

          ),
          floatingActionButton: FloatingActionButton(
              onPressed: fetchImage,
              child: Icon(Icons.add)
          ),
          body:ImageList(images)
        )
    );
  }

}