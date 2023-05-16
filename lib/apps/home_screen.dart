// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, prefer_const_constructors_in_immutables

import 'package:contacts_app/apps/contact_screen_details.dart';
import 'package:contacts_app/apps/data/info_data.dart';
import 'package:contacts_app/apps/modules/contacts.dart';
import 'package:flutter/material.dart';

import 'contact_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final infoData = InfoData();
  List<Contacts> contactsList = [];

  getContacts() {
    for (var item in infoData.contactList) {
      var contact = Contacts.fromJson(item);

      contactsList.add(contact);
    }
    setState(() {});
  }

  @override
  void initState() {
    getContacts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts App '),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: ListView(
            children: List.generate(contactsList.length, (index) {
              var contact = contactsList[index];
              return ContactScreen(
                  name: contact.name ?? "",
                  contact: contact.contact ?? "",
                  image: contact.image ?? "",
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ContactScreenDetails(
                          contact: contact,
                        ),
                      ),
                    );
                  });
            }),
          ),
        ),
      ),
    );
  }
}
