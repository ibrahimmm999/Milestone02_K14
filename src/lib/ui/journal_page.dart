import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:milestone/shared/theme.dart';
import 'package:milestone/ui/home_page.dart';
import 'package:milestone/ui/journal_detail_page.dart';
import 'package:milestone/widgets/custom_header.dart';

import 'journal_form.dart';

class JournalPage extends StatefulWidget {
  const JournalPage({Key? key}) : super(key: key);

  @override
  State<JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firebase = FirebaseFirestore.instance;

    //get collection from firebase, collection is table in mysql
    CollectionReference users = firebase.collection('journals');
    Widget content() {
      return FutureBuilder<QuerySnapshot>(
        //data to be retrieved in the future
        future: users.get(),
        builder: (_, snapshot) {
          //show if there is data
          if (snapshot.hasData) {
            // we take the document and pass it to a variable
            var alldata = snapshot.data!.docs;

            //if there is data, make list
            return alldata.length != 0
                ? ListView.builder(

                    // displayed as much as the variable data alldata
                    itemCount: alldata.length,

                    //make custom item with list tile.
                    itemBuilder: (_, index) {
                      return Container(
                          margin: EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  JournalDetailPage(
                                                    title: alldata[index]
                                                        ['title'],
                                                    contentJournal:
                                                        alldata[index]
                                                            ['content'],
                                                  )));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: kTransparentColor),
                                      width: 250,
                                      child: Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              alldata[index]['title'],
                                              style:
                                                  darkBrownTextStyle.copyWith(
                                                      fontSize: 14,
                                                      fontWeight: bold),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              alldata[index]['content'],
                                              overflow: TextOverflow.ellipsis,
                                              style: darkGreyTextStyle.copyWith(
                                                  fontSize: 13,
                                                  fontWeight: light),
                                              maxLines: 2,
                                            ),
                                            SizedBox(height: 15),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          //pass data to edit form
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  JournalFormPage(
                                                    id: snapshot
                                                        .data!.docs[index].id,
                                                  )),
                                        );
                                      },
                                      child: Container(
                                        height: 13,
                                        width: 18,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/GoJournal.png'))),
                                      ))
                                ],
                              ),
                              Divider(
                                height: 30,
                                indent: 25,
                                endIndent: 25,
                                thickness: 1,
                              )
                            ],
                          ));
                    })
                : Center(
                    child: Text(
                      'No Data',
                      style: blackTextStyle.copyWith(fontSize: 26),
                    ),
                  );
          } else {
            return Center(child: Text("Loading..."));
          }
        },
      );
    }

    Widget backIcon() {
      return GestureDetector(
        onTap: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
              (route) => false);
        },
        child: Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: EdgeInsets.only(left: 35, top: 160),
            height: 24.5,
            width: 31,
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage('assets/back_icon.png'))),
          ),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          Container(
              margin: EdgeInsets.only(),
              child: customHeader(
                title: 'Journals',
              )),
          backIcon(),
          Container(
            child: content(),
            margin: EdgeInsets.only(top: 220),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kOrangeColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => JournalFormPage()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
