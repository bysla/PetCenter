


class LoginRes {
  String _error;
  String _name;
  String _verification;
  int _id;
  LoginRes.fromJson(Map<String, dynamic> parsedJson) {
    _error = parsedJson['error'];
    _name = parsedJson['name'];
    _verification = parsedJson['verification'];
    _id = parsedJson['id'];
  }

  String get error => _error;

  String get name => _name;

  int get id => _id;

  String get verification => _verification;
}

class Incident {
  int _id;
  String _title;
  String _url;
  String _description;
  String _location;
  String _userId;
  String _name;
  String _email;
  String _whatsapp;

  Incident.fromJson(Map<String, dynamic> parsedJson) {
    _id = parsedJson['id'];
    _title = parsedJson['title'];
    _description = parsedJson['description'];
    _location = parsedJson['location'];
    _url = parsedJson['photoPath'];
    _userId = parsedJson['user_id'];
    _name = parsedJson['name'];
    _email = parsedJson['email'];
    _whatsapp = parsedJson['whatsapp'];
  }

  int get id => _id;

  String get title => _title;

  String get description => _description;

  String get location => _location;

  String get url => _url;

  String get userId => _userId;

  String get name => _name;

  String get email => _email;

  String get whatsapp => _whatsapp;

}