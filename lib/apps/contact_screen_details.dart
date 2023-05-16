// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:contacts_app/apps/modules/contacts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ContactScreenDetails extends StatelessWidget {
  ContactScreenDetails({super.key, required this.contact});

  final Contacts contact;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(contact.name ?? 'Contact Details'),
      ),
    );
  }
}
