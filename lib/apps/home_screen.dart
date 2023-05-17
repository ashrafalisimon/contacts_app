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
  List<Contacts> filterContactsList = [];

  bool searching = false;

  getContacts() {
    contactsList.clear();
    filterContactsList.clear();
    for (var item in infoData.contactList) {
      var contact = Contacts.fromJson(item);

      contactsList.add(contact);
      filterContactsList.add(contact);
    }
    setState(() {});
  }

  searchItem(String keyword) {
    List<Contacts> results = [];

    if (keyword.isEmpty) {
      results = contactsList;
    } else {
      results = contactsList
          .where((item) =>
              item.name!.toLowerCase().contains(keyword.trim().toLowerCase()) ||
              item.contact!
                  .toLowerCase()
                  .contains(keyword.trim().toLowerCase()))
          .toList();
    }
    if (filterContactsList.isNotEmpty) {
      filterContactsList.clear();
      filterContactsList.addAll(results);
    } else {
      filterContactsList = results;
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
        title: searching
            ? TextFormField(
                style: TextStyle(fontSize: 17),
                decoration: InputDecoration(
                  hintText: 'Search by name',
                  fillColor: Colors.white70,
                  filled: true,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        searching = false;
                      });
                    },
                    child: Icon(Icons.close),
                  ),
                ),
                onChanged: (value) {
                  searchItem(value);
                },
              )
            : Text('Contact List'),
        centerTitle: true,
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                searching = true;
              });
            },
            child: searching ? Container() : Icon(Icons.search),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: filterContactsList.isNotEmpty
              ? ListView(
                  children: List.generate(filterContactsList.length, (index) {
                    var contact = filterContactsList[index];
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
                )
              : Center(
                  child: Text('No item'),
                ),
        ),
      ),
    );
  }
}
