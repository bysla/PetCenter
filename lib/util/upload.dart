import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';


// My IPv4 : 192.168.43.171 
final String phpEndPoint = 'http://192.168.43.171/phpAPI/image.php';
final String nodeEndPoint = 'http://192.168.15.13:3333/test';
File file;

 void Choose() async {
   //file = await ImagePicker.pickImage(source: ImageSource.camera);
 file = await ImagePicker.pickImage(source: ImageSource.gallery);
 }

 void Upload() {
   print("aq1");
   if (file == null) return;
   print("aq2");
   String base64Image = base64Encode(file.readAsBytesSync());
   String fileName = file.path.split("/").last;
   print(fileName);

   http.post(nodeEndPoint, body: {
     "image": base64Image,
     "name": fileName,
   }).then((res) {
     print(res.statusCode);
   }).catchError((err) {
     print(err);
   });
 }