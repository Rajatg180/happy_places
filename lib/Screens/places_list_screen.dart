import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Providers/great_places.dart';
import 'package:flutter_complete_guide/Screens/add_places_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Places",
        ),
        actions: [
          IconButton(onPressed: () {
            Navigator.of(context).pushNamed(AddPlacesScreen.routeName);
          },
           icon: Icon(
            Icons.add,
           ),
          ),
        ],
      ),
      body: Consumer<GreatPlaces>(
        child: Center(child:const  Text('No Places added yet !')),
        builder: (context, greatPlaces, child) {
         return greatPlaces.iteams.length<=0 ? child : ListView.builder(itemBuilder: (context, index) =>
           ListTile(
            leading: CircleAvatar(
              backgroundImage: FileImage(greatPlaces.iteams[index].image),
            ),
            title: Text(
              greatPlaces.iteams[index].title.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        itemCount: greatPlaces.iteams.length,
        );
      },),
    );
  }
}