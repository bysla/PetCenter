import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';



// My IPv4 : 192.168.43.171 
final String phpEndPoint = 'http://192.168.43.171/phpAPI/image.php';
final String nodeEndPoint = 'http://192.168.15.13:3333/test';
File file;
bool dd = false;

 void Choose() async {
   //file = await ImagePicker.pickImage(source: ImageSource.camera);
 file = await ImagePicker.pickImage(source: ImageSource.gallery);
dd=true;
 }

 void Upload() {
   if (file == null) return;
   String base64Image = base64Encode(file.readAsBytesSync());
   String fileName = file.path.split("/").last;
   print(fileName);

   http.post(nodeEndPoint, body: {
     "image": file,
     "name": fileName,
   }).then((res) {
     print(res.statusCode);
   }).catchError((err) {
     print(err);
   });
 }

 AsyncFileUpload() async{
   //create multipart request for POST or PATCH method
   var request = http.MultipartRequest("POST", Uri.parse(nodeEndPoint));
    String fileName = file.path;
   request.files.add(
    http.MultipartFile(
      'image',
      File(fileName).readAsBytes().asStream(),
      File(fileName).lengthSync(),
      filename: fileName.split("/").last
    )
   
  );
   request.fields['user'] = "luis";
  var res = await request.send();
}