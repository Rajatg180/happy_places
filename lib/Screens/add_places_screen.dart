import 'package:flutter/material.dart';
import '../Widget/image_input.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import '../Providers/great_places.dart';
class AddPlacesScreen extends StatefulWidget {
  static const routeName='/add-place';
  @override
  State<AddPlacesScreen> createState() => _AddPlacesScreenState();
}

class _AddPlacesScreenState extends State<AddPlacesScreen> {
  //managing Controller
  final _titleController=TextEditingController();
  File _pickedImage;

  void _selectImage(File pickedImage){
    _pickedImage=pickedImage;
  }
  void _savePlace(){
    print(_titleController.text);
    print(_pickedImage);
    if(_titleController.text.isEmpty || _pickedImage==null){
      return ;
    }
    //passing title and image 
    Provider.of<GreatPlaces>(context,listen: false).addPlace(_titleController.text, _pickedImage);
    //after adding the new place the page will get poped
    Navigator.of(context).pop();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Place"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    controller: _titleController,
                  ),   
                  SizedBox(
                    height: 20,
                  ) ,
      
                  //passing pointer to selectImage method
                  ImageInput(_selectImage),        
                ],
                ),
              ),
            )
          ),
          ElevatedButton.icon(
            onPressed: (() {
              print("Button presed");
              return _savePlace();
            }),
            icon: Icon(Icons.add),
            label: Text("Add Place"),
          )
        ],
      ),
    );
  }
}