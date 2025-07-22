import 'package:flutter/material.dart';
import 'package:hoormedicalstore/provider/product_provider.dart';
import 'package:hoormedicalstore/widget/home_item_ui.dart';

import 'package:provider/provider.dart';

class HomeGridItemUi extends StatefulWidget {
  @override
  _HomeGridItemUiState createState() => _HomeGridItemUiState();
}

class _HomeGridItemUiState extends State<HomeGridItemUi> {
  @override
  Widget build(BuildContext context) {
    final productdata = Provider.of<ProductProvider>(context);
    final product = productdata.items;

    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 4,
                      color: Colors.deepPurple,
                    ),
                    borderRadius: BorderRadius.circular(19),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: GridTile(
                      child: Image.asset('assets/images/hoormedicalbanner1.png',
                          width: 300, height: 150, fit: BoxFit.cover),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 4,
                      color: Colors.deepPurple,
                    ),
                    borderRadius: BorderRadius.circular(19),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: GridTile(
                      child: Image.asset('assets/images/hoormedicalbanner2.png',
                          width: 300, height: 150, fit: BoxFit.cover),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 4,
                      color: Colors.deepPurple,
                    ),
                    borderRadius: BorderRadius.circular(19),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: GridTile(
                      child: Image.asset('assets/images/hoormedicalbanner.png',
                          width: 300, height: 150, fit: BoxFit.cover),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35), topRight: Radius.circular(35)),
          child: Container(
            padding: EdgeInsets.all(3),
            color: Colors.deepPurple,
            height: 45,
            width: double.infinity,
            child: Row(
              children: [
                SizedBox(
                  width: 34,
                ),
                Column(
                  children: [
                    Icon(
                      Icons.alarm_add,
                      color: Colors.white,
                    ),
                    Text(
                      'Reminder',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    )
                  ],
                ),
                SizedBox(
                  width: 70,
                ),
                Column(
                  children: [
                    Icon(
                      Icons.alternate_email,
                      color: Colors.white,
                    ),
                    Text(
                      'Alternate',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    )
                  ],
                ),
                SizedBox(
                  width: 70,
                ),
                Column(
                  children: [
                    Icon(
                      Icons.chat_outlined,
                      color: Colors.white,
                    ),
                    Text(
                      'Chat with us',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: product.length,
            itemBuilder: (context, index) {
              return HomeItemUi(product[index]);
            },
          ),
        ),
      ],
    );
  }
}
