// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(45),
                bottomRight: Radius.circular(45))),
        centerTitle: true,
        title: Text('Users'),
        backgroundColor: Colors.deepPurple,
      ),
      body: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('User') // Ensure this matches Firestore
              .orderBy('CreatedAt', descending: true) // Use correct field name
              .get(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Error while fetching data'));
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CupertinoActivityIndicator());
            }
            if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
              return Center(child: Text('No User Found'));
            }

            return ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final data = snapshot.data!.docs[index];

                  // Extract only available fields
                  String userId = data['UserId'] ?? 'Unknown ID';
                  String userName = data['UserName'] ?? 'No Name';
                  String userEmail = data['UserEmail'] ?? 'No Email';
                  Timestamp createdAt = data['CreatedAt'] ?? Timestamp.now();

                  return Card(
                    elevation: 5,
                    child: ListTile(
                      title: Text(userName),
                      subtitle: Text(userEmail),
                      trailing: Icon(Icons.edit),
                    ),
                  );
                });
          }),
    );
  }
}
