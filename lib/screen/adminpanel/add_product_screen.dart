// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoormedicalstore/controller/product_image_controller.dart';
import 'package:hoormedicalstore/screen/adminpanel/uploaded_products.dart';

class AddProductScreen extends StatelessWidget {
  ProductImageController productImageController =
      Get.put(ProductImageController());

  TextEditingController titleController = TextEditingController();

  TextEditingController priceController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  User? userid = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Products'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        toolbarHeight: 100,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(45),
                bottomRight: Radius.circular(45))),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          GetBuilder<ProductImageController>(
              init: ProductImageController(),
              builder: (imagecontroller) {
                return imagecontroller.selectedimage.length > 0
                    ? Container(
                        width: MediaQuery.of(context).size.width - 20,
                        height: Get.height / 3.0,
                        child: GridView.builder(
                            itemCount:
                                productImageController.selectedimage.length,
                            physics: const BouncingScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 20,
                                    crossAxisSpacing: 10),
                            itemBuilder: (BuildContext context, int index) {
                              return Stack(
                                children: [
                                  Image.file(
                                    File(productImageController
                                        .selectedimage[index].path),
                                    fit: BoxFit.cover,
                                    height: Get.height / 4,
                                    width: Get.width / 2,
                                  ),
                                  Positioned(
                                      right: 10,
                                      top: 0,
                                      child: InkWell(
                                        onTap: () {
                                          productImageController
                                              .removeImages(index);
                                        },
                                        child: CircleAvatar(
                                          child: Icon(Icons.close),
                                        ),
                                      ))
                                ],
                              );
                            }),
                      )
                    : SizedBox.shrink();
              }),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            child: TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                  hintText: 'Enter Product Title',
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 2, color: Colors.deepPurple))),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            child: TextFormField(
              controller: priceController,
              decoration: InputDecoration(
                  hintText: 'Enter Product Price',
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 2, color: Colors.deepPurple))),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            child: TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(
                  hintText: 'Enter Product Description',
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 2, color: Colors.deepPurple))),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  productImageController.showImagepickerDialog();
                },
                child: Text(
                  'Select Image',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple),
              ),
              ElevatedButton(
                onPressed: () async {
                  var productTitle = titleController.text.trim();
                  var productPrice = priceController.text.trim();
                  var productDescription = descriptionController.text.trim();

                  try {
                    await FirebaseFirestore.instance
                        .collection('Product')
                        .doc()
                        .set({
                      'CreatedAt': DateTime.now(),
                      'Title': productTitle,
                      'Price': productPrice,
                      'Description': productDescription,
                      'Userid': userid!.uid
                    });
                    Get.to(() => UploadedProducts());
                  } on FirebaseAuthException catch (e) {
                    print('Error $e');
                  }
                },
                child: Text(
                  'Add Product',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple),
              ),
            ],
          )
        ],
      ),
    );
  }
}
