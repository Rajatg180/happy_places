import 'dart:ui';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart ' as path;
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
class ImageInput extends StatefulWidget {
  final Function onSelectImage;
  ImageInput(this.onSelectImage);
  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;
  //taking image
  Future<void> _TakePicture() async{
    //creating instance of the ImagePicker() class
    final picker=ImagePicker();
    //accesing the constuctor pickImage
    //getImage
    final  imageFile=await picker.pickImage(source: ImageSource.camera,maxWidth: 600);
    print('_TakePicture()');
    if(imageFile==null){
      return ;
    }
    setState(() {
      _storedImage=File(imageFile.path);
    });
    //getting file directory 
    final appDir=await syspaths.getApplicationDocumentsDirectory();
    //getting the name of the image
    final fileName=path.basename(imageFile.path);
    final savedImage=await imageFile.saveTo('${appDir.path}/${fileName}');

    //passing image using pointer 
    widget.onSelectImage(savedImage);
  }
  @override
  Widget build(BuildContext context) {
    print("Pick Image");
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          height: 200,
          width: 200,
          decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.grey),),
          child: _storedImage!=null? Image.file(_storedImage,fit: BoxFit.cover,width: double.infinity,) : Text("No Image Taken ",textAlign: TextAlign.center,),
          
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextButton.icon(
            icon: Icon(Icons.camera,),
            label: Text("Take Picture"),
            onPressed:  _TakePicture,
            
          ),
        )
      ],
    );
  }
}