import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoormedicalstore/model/admin_product_model.dart';
import 'package:hoormedicalstore/screen/adminpanel/add_product_screen.dart';
import 'package:hoormedicalstore/screen/adminpanel/single_product_detail_screen.dart';

class UploadedProducts extends StatefulWidget {
  @override
  State<UploadedProducts> createState() => _UploadEditProductScreenState();
}

class _UploadEditProductScreenState extends State<UploadedProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Products'),
        toolbarHeight: 100,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(45),
                bottomRight: Radius.circular(45))),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: FirebaseFirestore.instance
                .collection('Product') // Ensure this matches Firestore
                .orderBy('CreatedAt',
                    descending: true) // Use correct field name
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
                    AdminProductModel adminProductModel = AdminProductModel(
                        ProductTitle: data['Title'] ?? 'No Title',
                        CreatedAt: data['CreatedAt'] ?? DateTime.now(),
                        ProductPrice: data['Price'] ?? 'No Price',
                        ProductDescription:
                            data['Description'] ?? 'No Description');

                    return Card(
                      elevation: 5,
                      child: ListTile(
                        title: Text(adminProductModel.ProductTitle),
                        subtitle: Text(adminProductModel.ProductPrice),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () => Get.to(
                            () => SingleProductDetailScreen(adminProductModel)),
                      ),
                    );
                  });
            }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () => Get.to(() => AddProductScreen()),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
