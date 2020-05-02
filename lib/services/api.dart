import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../class/class.dart';

String baseURL = 'http://192.168.15.14:3333/';




Login(email, senha) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var res = await http.post(baseURL + 'session',
      headers: {"Accept": "application/json"},
      body: {'email': email, 'password': senha},
      encoding: Encoding.getByName("utf-8"));

  var resJson = json.decode(res.body);
  LoginRes loginRes = LoginRes.fromJson(resJson);
  
  
  if (loginRes.error == null) {
    await prefs.setString("id", loginRes.id.toString());
    await prefs.setString("name", loginRes.name);
    await prefs.setString("verification", loginRes.verification);
    return 0;
  }
  await prefs.setString("error", loginRes.error);
  return 1;
}

GetIncidents(pages) async {
//Map data;
  var res = await http.get(baseURL + 'incidents?page=' + pages.toString());
  var resJson = json.decode(res.body);
  int total = int.parse(res.headers['x-count']);
  List<Incident> incidents = new List<Incident>();
  for (var i = 0; i < total; i++) {
    Incident incident = Incident.fromJson(resJson[i]);
    incidents.add(incident);
  }
  return incidents;
}

GetTotal() async {
  var res = await http.get(baseURL + 'incidents?page=200');
  int total = int.parse(res.headers['x-total-count']);
  return total;
}

GetMyIncidents() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var res = await http.get(baseURL + 'profile',
  headers: {"Authorization": prefs.getString("id")}, );
  var resJson = json.decode(res.body);
  int total = int.parse(res.headers['x-count']);
  List<Incident> incidents = new List<Incident>();
  for (var i = 0; i < total; i++) {
    Incident myIncident = Incident.fromJson(resJson[i]);
    incidents.add(myIncident);
  }
  return incidents;
}

Register(name, email, pass, whats) async{

SharedPreferences prefs = await SharedPreferences.getInstance();
  var res = await http.post(baseURL + 'user',
      headers: {"Accept": "application/json"},
      body: {
        'name': name,
         'password': pass,
         'email': email,
         'whatsapp': whats,
         },
      encoding: Encoding.getByName("utf-8"));

  var resJson = json.decode(res.body);
  print(resJson['id']);
  if (resJson['error'] == null) {
    
    await prefs.setString("id", resJson['id'].toString());
    await prefs.setString("name", name);
    await prefs.setString("verification", resJson['verification']);
    return 0;
  }
  await prefs.setString("error", resJson['error']);
  return 1;
}
