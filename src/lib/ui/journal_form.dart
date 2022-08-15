// ignore_for_file: unnecessary_new, unused_field, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, unused_import, use_key_in_widget_constructors, avoid_print, unused_element

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:milestone/ui/journal_page.dart';
import 'package:milestone/widgets/custom_appbar.dart';
import 'package:milestone/widgets/custom_button.dart';

import '../shared/theme.dart';

class JournalFormPage extends StatefulWidget {
  //constructor have one parameter, optional paramter
  //if have id we will show data and run update method
  //else run add data
  const JournalFormPage({this.id});

  final String? id;

  @override
  State<JournalFormPage> createState() => _JournalFormPageState();
}

class _JournalFormPageState extends State<JournalFormPage> {
  //set form key
  final _formKey = GlobalKey<FormState>();

  //set texteditingcontroller variable
  var titleController = TextEditingController();
  var contentController = TextEditingController();

  FirebaseFirestore firebase = FirebaseFirestore.instance;
  CollectionReference? users;

  void getData() async {
    //get users collection from firebase
    //collection is table in mysql
    users = firebase.collection('journals');

    //if have id
    if (widget.id != null) {
      //get users data based on id document
      var data = await users!.doc(widget.id).get();

      //we get data.data()
      //so that it can be accessed, we make as a map
      var item = data.data() as Map<String, dynamic>;

      //set state to fill data controller from data firebase
      setState(() {
        titleController = TextEditingController(text: item['title']);
        contentController = TextEditingController(text: item['content']);
      });
    }
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        //this form for add and edit data
        //if have id passed from main, field will show data
        body: Form(
      key: _formKey,
      child: ListView(children: [
        CustomAppBar(title: 'Your Journal'),
        SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.only(top: 40, right: 25, left: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Title', style: blackTextStyle.copyWith(fontSize: 16)),
              SizedBox(height: 10),
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                    hintText: "Title",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    fillColor: Colors.white,
                    filled: true),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Title is Required!';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Text(
                'Content',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: contentController,
                keyboardType: TextInputType.multiline,
                minLines: 6,
                maxLines: null,
                decoration: InputDecoration(
                    hintText: "Content",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    fillColor: Colors.white,
                    filled: true),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Content is Required!';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin:
                    EdgeInsets.only(top: 40, left: 40, right: 40, bottom: 60),
                child: CustomButton(
                    buttonColor: kGreenColor,
                    heightButton: 55,
                    buttonText: 'Submit',
                    widthButton: double.infinity,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        //if id not null run add data to store data into firebase
                        //else update data based on id
                        if (widget.id == null) {
                          users!.add({
                            'title': titleController.text,
                            'content': contentController.text,
                          });
                        } else {
                          users!.doc(widget.id).update({
                            'title': titleController.text,
                            'content': contentController.text,
                          });
                        }
                        //snackbar notification
                        final snackBar =
                            SnackBar(content: Text('Data saved successfully!'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => JournalPage()),
                            (route) => false);
                      }
                      ;
                    }),
              ),
            ],
          ),
        )
      ]),
    ));
  }
}
