import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hoormedicalstore/provider/profile_provider.dart';
import 'package:hoormedicalstore/screen/product_overview_screen.dart';
import 'package:hoormedicalstore/screen/profile_edited_screen.dart';

class Profile extends StatelessWidget {
  final ProfileItem _profileData;
  Profile(this._profileData);
  static const routeName = '/profileScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40))),
        toolbarHeight: 70,
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        leading: BackButton(
            color: Colors.white,
            onPressed: () => Navigator.of(context)
                .pushReplacementNamed(ProductOverviewScreen.routeName)),
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                        radius: 60,
                        backgroundImage: _profileData.imageurl.isNotEmpty
                            ? FileImage(File(_profileData.imageurl))
                            : null),
                    Positioned(
                        left: 80,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: IconButton(
                              onPressed: () => Navigator.of(context)
                                  .pushNamed(ProfileEditedScreen.routeName),
                              icon: Icon(
                                Icons.edit,
                                color: Colors.black,
                              )),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Column(
                children: [
                  Text(
                    _profileData.name.isNotEmpty
                        ? _profileData.name
                        : 'User Name',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: const Color.fromARGB(255, 0, 0, 0)),
                  ),
                ],
              ),
              Divider(),
              SizedBox(
                height: 20,
              ),
              Text(
                _profileData.email.isNotEmpty
                    ? _profileData.email
                    : '@gmail.com/Yahoo!',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: const Color.fromARGB(255, 0, 0, 0)),
              ),
              Divider(),
              SizedBox(
                height: 20,
              ),
              Text(
                _profileData.mobileNumber.isNotEmpty
                    ? _profileData.mobileNumber
                    : '+92 0000-1111-000',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: const Color.fromARGB(255, 0, 0, 0)),
              ),
              Divider(),
              SizedBox(
                height: 20,
              ),
              Text(
                _profileData.currentaddress.isNotEmpty
                    ? _profileData.currentaddress
                    : 'Any palce',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: const Color.fromARGB(255, 0, 0, 0)),
              ),
              Divider(),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
