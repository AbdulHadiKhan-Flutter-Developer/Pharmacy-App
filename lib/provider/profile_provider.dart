import 'package:flutter/material.dart';

// Define the ProfileItem class
class ProfileItem {
  final String id;
  final String name;
  final String email;
  final String mobileNumber;
  final String currentaddress;
  final String imageurl;

  ProfileItem({
    required this.id,
    required this.name,
    required this.email,
    required this.mobileNumber,
    required this.currentaddress,
    required this.imageurl,
  });
}

// Define the ProfileProvider class
class ProfileProvider with ChangeNotifier {
  List<ProfileItem> _items = [
    ProfileItem(
      id: 'profile',
      name: 'User Name',
      email: '@gmail.com',
      mobileNumber: '+92 0000-0000-00',
      currentaddress: 'XYZ',
      imageurl: '',
    ),
  ];

  // Getter for the items list
  List<ProfileItem> get items {
    return [..._items];
  }

  // Method to find a ProfileItem by ID
  ProfileItem findById(String id) {
    return _items.firstWhere((profileId) => profileId.id == id);
  }

  // Method to update a ProfileItem
  void updateProfileItem(ProfileItem item) {
    int index = _items.indexWhere((element) => element.id == item.id);
    if (index != -1) {
      _items[index] = item;
      notifyListeners();
    }
  }
}
