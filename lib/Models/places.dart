import 'dart:io';
import 'package:flutter/foundation.dart';

class PlaceLoaction{
  final double latitude;
  final double longitude;
  final String address;

  PlaceLoaction({
   @required this.latitude,
   @required this.longitude,
   this.address,
  });
}

class Places{
  final String id;
  final String title;
  final PlaceLoaction loaction;
  final File image;

  Places({
    @required this.id,
    @required this.title,
    @required this.loaction,
    @required this.image
  });
}