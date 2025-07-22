import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ProductImageController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  RxList<XFile> selectedimage = <XFile>[].obs;
  final FirebaseStorage storageref = FirebaseStorage.instance;

  Future<void> showImagepickerDialog() async {
    PermissionStatus status;
    DeviceInfoPlugin deviceinfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidDeviceInfo = await deviceinfo.androidInfo;

    if (androidDeviceInfo.version.sdkInt <= 32) {
      status = await Permission.storage.request();
    } else {
      status = await Permission.photos
          .request(); // ✅ Correct permission for Android 13+
    }

    if (status == PermissionStatus.granted) {
      Get.defaultDialog(
        title: 'Choose Image',
        middleText: 'Pick an image from the Camera or Gallery',
        actions: [
          ElevatedButton(
            onPressed: () => selectImages('camera'), // ✅ Fixed function call
            child: Text('Camera'),
          ),
          ElevatedButton(
            onPressed: () => selectImages('gallery'), // ✅ Fixed function call
            child: Text('Gallery'),
          ),
        ],
      );
    } else if (status == PermissionStatus.denied ||
        status == PermissionStatus.permanentlyDenied) {
      print('Please allow permission for further usage');
      openAppSettings();
    }
  }

  Future<void> selectImages(String type) async {
    List<XFile> imgs = [];

    if (type == 'gallery') {
      try {
        imgs = await _picker.pickMultiImage(imageQuality: 80);
      } catch (e) {
        print('Error: $e');
      }
    } else {
      final img =
          await _picker.pickImage(source: ImageSource.camera, imageQuality: 80);
      if (img != null) {
        imgs.add(img);
      }
    }

    if (imgs.isNotEmpty) {
      selectedimage.addAll(imgs);
      update();
    }
  }

  void removeImages(int index) {
    selectedimage.removeAt(index);
    update();
  }
}
