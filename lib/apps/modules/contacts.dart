// ignore_for_file: camel_case_types

class Contacts {
  int? id;
  String? name;
  String? contact;
  String? image;

  Contacts({this.id, this.name, this.contact, this.image});

  Contacts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    contact = json['contact'];
    image = json['image'];
  }
}
