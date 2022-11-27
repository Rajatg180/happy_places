import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Providers/great_places.dart';
import 'package:flutter_complete_guide/Screens/add_places_screen.dart';
import 'Screens/places_list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      //instance of class
      value: GreatPlaces(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: PlacesListScreen(),
        routes: {
          AddPlacesScreen.routeName:(context) => AddPlacesScreen(),
        },
      ),
    );
  }
}

