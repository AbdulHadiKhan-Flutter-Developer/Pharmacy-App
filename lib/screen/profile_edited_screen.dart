import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hoormedicalstore/provider/profile_provider.dart';
import 'package:hoormedicalstore/screen/profile.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfileEditedScreen extends StatefulWidget {
  static const routeName = '/ProfileEditedScreen';

  @override
  _ProfileEditedScreenState createState() => _ProfileEditedScreenState();
}

class _ProfileEditedScreenState extends State<ProfileEditedScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final pnumberController = TextEditingController();
  final addressController = TextEditingController();
  File? _selectedImage;

  @override
  void initState() {
    super.initState();
    ProfileItem currentdata =
        Provider.of<ProfileProvider>(context, listen: false)
            .findById('profile');
    nameController.text = currentdata.name;
    emailController.text = currentdata.email;
    addressController.text = currentdata.currentaddress;
    pnumberController.text = currentdata.mobileNumber;
  }

  void _selectImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
        toolbarHeight: 70,
        leading: BackButton(
          onPressed: () =>
              Navigator.of(context).pushReplacementNamed(Profile.routeName),
          color: Colors.white,
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text(
          'Profile Edit',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: _selectedImage != null
                          ? FileImage(_selectedImage!)
                          : NetworkImage(
                              Provider.of<ProfileProvider>(context)
                                  .items
                                  .first
                                  .imageurl,
                            ),
                    ),
                    Positioned(
                      bottom: -10,
                      left: 80,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: _selectImage,
                          icon: Icon(
                            Icons.add_a_photo,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Form(
                child: TextFormField(
                  decoration: InputDecoration(label: Text('Name')),
                  controller: nameController,
                ),
              ),
              SizedBox(height: 10),
              Form(
                child: TextFormField(
                  decoration: InputDecoration(label: Text('E-Mail')),
                  controller: emailController,
                ),
              ),
              SizedBox(height: 10),
              Form(
                child: TextFormField(
                  decoration: InputDecoration(label: Text('Phone Number')),
                  controller: pnumberController,
                ),
              ),
              SizedBox(height: 10),
              Form(
                child: TextFormField(
                  decoration: InputDecoration(label: Text('Current Address')),
                  controller: addressController,
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    ProfileItem profileupdate = ProfileItem(
                      id: 'profile',
                      name: nameController.text,
                      email: emailController.text,
                      mobileNumber: pnumberController.text,
                      currentaddress: addressController.text,
                      imageurl:
                          _selectedImage != null ? _selectedImage!.path : '',
                    );
                    Provider.of<ProfileProvider>(context, listen: false)
                        .updateProfileItem(profileupdate);
                    Navigator.of(context)
                        .pushReplacementNamed(Profile.routeName);
                  },
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
